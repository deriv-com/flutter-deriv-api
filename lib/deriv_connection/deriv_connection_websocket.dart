library wsapi;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_deriv_api/helpers.dart';
import 'package:preferences/preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/balance_send.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/api/balance_receive.dart';
import 'package:flutter_deriv_api/mock_data/mock_server.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/api/get_settings_receive.dart';
import 'package:flutter_deriv_api/api/website_status_receive.dart';
import 'package:flutter_deriv_api/deriv_connection/subscription_stream.dart';

/// Represent a pending request.
class PendingRequest<T> {
  final String method;
  final Map<String, dynamic> request;
  final Completer<T> response;
  SubscriptionStream<T> _streamController;
  String _subscriptionId;

  bool get isSubscribed => _streamController != null;

  SubscriptionStream get streamController => _streamController;

  String get subscriptionId => _subscriptionId;

  set streamController(value) => _streamController = value;

  set subscriptionId(value) => _subscriptionId = value;

  PendingRequest({this.method, this.request, this.response});
}

/// Represents a message sent or received via the webSockets connection
class HistoryEntry {
  final int timestamp;
  final String method;
  final Object message;

  HistoryEntry({this.timestamp, this.method, this.message});
}

/// Provides storage for messages sent/received via the WebSocket connection
class APIHistory {
  /// Messages that were sent to the remote endpoint
  final List<HistoryEntry> outgoing = [];

  /// Messages that were received from the remote endpoint
  final List<HistoryEntry> incoming = [];
  int _limit = 1000;

  get limit => _limit;

  set limit(int limit) {
    _limit = limit;
    trimIncoming();
    trimOutgoing();
  }

  // Trim early entries from the list if we exceed the current limit
  void trimOutgoing() {
    if (outgoing.length >= limit) {
      outgoing.removeRange(0, (limit - outgoing.length) - 1);
    }
  }

  void trimIncoming() {
    // Trim early entries
    if (incoming.length >= limit) {
      incoming.removeRange(0, (limit - incoming.length) - 1);
    }
  }

  /// Record a message being sent to the remote endpoint
  void pushOutgoing({timestamp, method, message}) {
    outgoing.add(
        HistoryEntry(timestamp: timestamp, method: method, message: message));
    trimOutgoing();
  }

  /// Record a message that was received from the remote endpoint
  void pushIncoming({timestamp, method, message}) {
    incoming.add(
        HistoryEntry(timestamp: timestamp, method: method, message: message));
    trimIncoming();
  }
}

class BinaryAPI {
  bool _isMockData = false;

  List<String> _MOCK_SERVER_BLOCK_LIST = [
    'authorize',
    'balance',
    'get_settings',
    'time',
    'ping',
    'p2p_advertiser_info',
  ];

  /// Indicates current connection status - only set `true` once
  /// we have established SSL *and* WebSocket handshake steps
  bool _connected = false;

  /// Represents the active WebSocket connection
  IOWebSocketChannel chan;
  StreamSubscription wsListener;

  /// Represent MockServer
  MockServer mockServer;
  StreamSubscription mockServerListener;

  /// Tracks our internal counter for requests, always increments until the connection is closed
  int lastRequestId = 0;

  /// Any requests that are currently in-flight
  Map<int, PendingRequest<Map<String, dynamic>>> pendingRequests = {};

  /// All requests and responses
  final APIHistory history = APIHistory();

  /// Target endpoint - can be:
  ///
  /// - a full URL
  /// - a hostname
  /// - qaXX
  String get endpoint =>
     'blue.binaryws.com'; // parseWSUrl(PrefService.get('endpoint')) ?? 'blue.binaryws.com';

  /// Which application this is - the default
  /// is our OTC cashier in production
  String get appID => '1015';// PrefService.get('appId') ?? '1008';

  /// The language that should be used to show the context.
  String get language => 'en';// PrefService.get('language') ?? 'en';

  /// The brand name
  String brand = 'deriv';

  /// Calls the WebSocket API with the given method name and parameters.
  Future<dynamic> call(final String method, {Map<String, dynamic> req}) {
    if (req == null) {
      req = <String, dynamic>{};
    }

    // Trims the req since the api serialization doesn't work properly.
    req.removeWhere((key, value) => value == null);

    // Allow caller to specify their own request ID
    req.putIfAbsent('req_id', nextRequestId);
    // Some methods pass a specific value for the method name, e.g. ticks => 'frxUSDJPY'
    req.putIfAbsent(method, () => 1);

    final f = Completer<Map<String, dynamic>>();
    pendingRequests[req['req_id']] =
        PendingRequest(method: method, request: req, response: f);

    dev.log('Queuing outgoing request', error: jsonEncode(req));

    final List<int> data = utf8.encode(jsonEncode(req));
    history.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: req,
      method: method,
    );
    if (!_isMockData || _MOCK_SERVER_BLOCK_LIST.contains(method)) {
      chan.sink.add(data);
    } else {
      mockServer.add(req);
    }
    return f.future;
  }

  Stream<dynamic> subscribe(final String method, {Map<String, dynamic> req}) {
    if (req == null) {
      req = <String, dynamic>{};
    }

    req.putIfAbsent('req_id', nextRequestId);
    req.putIfAbsent('subscribe', () => 1);

    SubscriptionStream<Map<String, dynamic>> subscriptionStream =
        SubscriptionStream();

    call(method, req: req);

    pendingRequests[req['req_id']].streamController = subscriptionStream;

    return subscriptionStream.stream;
  }

  Future<Map<String, dynamic>> unsubscribe(String subscriptionId,
      {shouldForced = false}) async {
    final int reqId = pendingRequests.keys.singleWhere(
        (int id) => pendingRequests[id].subscriptionId == subscriptionId);

    final PendingRequest pendingRequest = pendingRequests[reqId];

    if (pendingRequest.streamController.hasListener && !shouldForced) {
      throw Exception('The stream has listener');
    }

    // Send forget request
    final Map<String, dynamic> response =
        await call('forget', req: {'forget': pendingRequest.subscriptionId});

    if (!response.containsKey('error')) {
      // Remove the the request from pending requests
      pendingRequests.remove(reqId);
      pendingRequest.streamController.closeStream();
    }

    return response;
  }

  Future<dynamic> unsubscribeAll(String method, {shouldForced = false}) async {
    final reqIds = pendingRequests.keys.where((int id) =>
        pendingRequests[id].method == method &&
        pendingRequests[id].isSubscribed);

    final Map<String, dynamic> response =
        await call('forget_all', req: {'forget_all': method});

    if (!response.containsKey('error')) {
      reqIds.forEach((id) async {
        await pendingRequests[id].streamController.closeStream();
        pendingRequests.remove(id);
      });
    }

    return response;
  }

  int nextRequestId() {
    dev.log('Assigning ID, last was $lastRequestId');
    return ++lastRequestId;
  }

  void handleResponse(
      Completer<bool> connectionCompleter, Map<String, dynamic> msg) {
    try {
      dev.log('Have message', error: msg.runtimeType);
      final Map<String, dynamic> m = Map<String, dynamic>.from(msg);
      print('and we cast to ');
      print(m.runtimeType);
      if (!_connected) {
        print('WS is connected');
        _connected = true;
        connectionCompleter.complete(true);
      }

      history.pushIncoming(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        method: m.containsKey('msg_type') ? m['msg_type'] : 'unknown',
        message: m,
      );

      print('API response: $m');
      print('Check for req_id in received message');
      if (m.containsKey('req_id')) {
        print('Have req_id in received message:');
        print(m['req_id'].runtimeType);
        final int reqId = m['req_id'];
        print('Have request ID ' + reqId.toString());
        if (pendingRequests.containsKey(reqId)) {
          print('Completing request for ' + reqId.toString());
          final Completer c = pendingRequests[reqId].response;

          if (!c.isCompleted) {
            c.complete(m);
          }

          // Checks if the request was a subscription or not.
          if (pendingRequests[reqId].streamController != null) {
            // Adds the subscription id to the pendingRequest object for further references.
            if (m.containsKey('subscription')) {
              pendingRequests[reqId].subscriptionId = m['subscription']['id'];
            }

            // Broadcasts the new message into the stream.
            pendingRequests[reqId].streamController.add(m);
          } else {
            // Removes the pendingRequest when it's not a subscription, the subscription requests will be remove after unsubscribing.
            pendingRequests.remove(reqId);
          }

          print('Completed request');
        } else {
          print(
              'This has a request ID, but does not match anything in our pending queue');
        }
      } else {
        print('No req_id, ignoring');
      }
    } catch (e) {
      print('Failed to process $msg - $e');
    }
  }

  Future<IOWebSocketChannel> run({void onDone(), void onOpen()}) async {
    _connected = false;
    _isMockData = false;//PrefService.get('mock') ?? false;

    Uri u = Uri(
      scheme: "wss",
      host: 'www.binaryqa10.com',
      path: "/websockets/v3",
      queryParameters: {
        // The Uri.queryParameters only accept Map<String, dynamic/*String|Iterable<String>*/>
        'app_id': '1015',
        'l': language,
        'brand': brand,
      },
    );

    dev.log('Connecting to $u');
    print('Connecting to $u');

    Completer<bool> c = Completer<bool>();

    // initialize ws server
    chan = IOWebSocketChannel.connect(u.toString());

    wsListener = chan // .cast<String>().transform(utf8.decode)
        .stream
        .map((str) => jsonDecode(str))
        .listen((msg) {
      handleResponse(c, msg);
    }, onError: (error) {
      print('The WS connection is closed: $error');
    }, onDone: () async {
      print('WS is Closed!');
      _connected = false;
      if (onDone != null) {
        onDone();
      }
    });

    // initialize mock server
    if (_isMockData) {
      mockServer = MockServer.instance();
      mockServerListener =
          mockServer.stream.listen((msg) => handleResponse(c, msg));
    }

    print('Send initial message');
    call('ping');
    c.future.then((_) {
      print('WS is connected!');
      if (onOpen != null) {
        onOpen();
      }
    });
    return chan;
  }

  Future<void> close() async {
    // The onDone function of the listener is set to null intentionally
    // to prevent it from being invoked after destroying the WebSocket object.
    wsListener.onDone(null);
    wsListener.onError(null);

    await wsListener.cancel();

    if (_connected) {
      await chan.sink.close(status.goingAway);
    }

    if (_isMockData) {
      await mockServerListener.cancel();
      await mockServer.sink.close();
      await mockServer.closeStream();
    }
    wsListener = null;
    chan = null;
    mockServer = null;
    mockServerListener = null;
  }

  Future<AuthorizeResponse> authorize(String token) async {
    AuthorizeResponse authObj;
    try {
      AuthorizeRequest authReq = AuthorizeRequest();
      authReq.authorize = token;
      print('Auth Request is ${authReq.toJson()}');
      Map<String, dynamic> authRes =
          await call('authorize', req: authReq.toJson());

      print('Auth response is $authRes');

      authObj = AuthorizeResponse.fromJson(authRes);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return authObj;
  }

  Future<BalanceResponse> balance() async {
    BalanceResponse balanceResponse;
    try {
      BalanceRequest balanceReq = BalanceRequest();
      Map<String, dynamic> balanceRes =
          await call('balance', req: balanceReq.toJson());

      balanceResponse = BalanceResponse.fromJson(balanceRes);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return balanceResponse;
  }

  Future<GetSettingsResponse> getSetting() async {
    Map<String, dynamic> resp = await call('get_settings');

    print('Account Settings: $resp');

    GetSettingsResponse settings = GetSettingsResponse.fromJson(resp);

    return settings;
  }

  Future<Map<String, dynamic>> p2pAdvertList({
    final String accountCurrency,
    final String advertiserId,
    final double amount,
    final String country,
    final String counterpartyType,
    final int limit,
    final int offset,
    final String targetCurrency,
  }) {
    // Later, we should use derivAPI schema classes to convert request and response
    return call(
      'p2p_advert_list',
      req: {
        'account_currency': accountCurrency,
        'counterparty_type': counterpartyType,
        'country': country,
        'target_currency': targetCurrency,
        'advertiser_id': advertiserId,
        'offset': offset,
        'limit': limit,
      },
    );
  }

  Future<Map<String, dynamic>> p2pAdvertInfo(int id,
      {double amount, bool subscribe}) {
    Map<String, dynamic> req = {'amount': amount, 'id': id};

    if (subscribe) {
      req['subscribe'] = 1;
    }
    return call('p2p_advert_info', req: req);
  }

  Future<Map<String, dynamic>> p2pOrderCreate(String advertId, double amount,
      {bool subscribe = false}) {
    Map<String, dynamic> req = {'amount': amount, 'advert_id': advertId};

    if (subscribe) {
      req['subscribe'] = 1;
    }

    return call('p2p_order_create', req: req);
  }

  Future<Map<String, dynamic>> p2pAdvertCreate(Map<String, dynamic> advert) {
    Map<String, dynamic> req = {
      'type': advert['type'],
      'amount': advert['amount'],
      'max_order_amount': advert['max_order_amount'],
      'payment_method': advert['payment_method'],
      'min_order_amount': advert['min_order_amount'],
      'description': advert['description'],
      'rate': advert['rate'],
    };
    return call('p2p_advert_create', req: req);
  }

  Future<Map<String, dynamic>> p2pOrderCancel(String id) {
    Map<String, dynamic> req = {'id': id};

    return call('p2p_order_cancel', req: req);
  }

  Future<Map<String, dynamic>> p2pAdvertUpdate(Map<String, dynamic> req) {
    return call('p2p_advert_update', req: req);
  }

  Future<Map<String, dynamic>> p2pAdvertRemove(String id) {
    return call('p2p_advert_remove', req: {'id': id});
  }

  Future<Map<String, dynamic>> p2pOrderList({
    int advertId,
    int offset,
    int limit,
    bool isActive,
  }) {
    return call('p2p_order_list', req: {
      'advert_id': advertId,
      'active': (isActive ?? false) ? 0 : 1,
      if (offset != null) 'offset': offset,
      if (limit != null) 'limit': limit,
    });
  }

  Stream<Map<String, dynamic>> subscribeP2pOrderList({
    int advertId,
    int offset,
    int limit,
    bool isHistorical,
  }) {
    return subscribe('p2p_order_list', req: {
      'advert_id': advertId,
      'active': (isHistorical ?? false) ? 0 : 1,
      if (offset != null) 'offset': offset,
      if (limit != null) 'limit': limit,
    });
  }

  Future<Map<String, dynamic>> p2pOrderInfo({
    String id,
  }) {
    return call('p2p_order_info', req: {
      'id': id,
    });
  }

  Stream<Map<String, dynamic>> subscribeOrderInfo({String id}) {
    return subscribe('p2p_order_info', req: {
      'id': id,
    });
  }

  Future<Map<String, dynamic>> p2pOrderConfirm(String id,
      {Map<String, dynamic> options}) {
    options = options ?? {};
    options['id'] = id;

    return call('p2p_order_confirm', req: options);
  }

  Future<Map<String, dynamic>> p2pAgentInfo({Map<String, dynamic> options}) {
    return call('p2p_advertiser_info', req: options);
  }

  Future<Map<String, dynamic>> p2pAdvertiserAdverts({
    final int limit,
    final int offset,
  }) {
    // Later, we should use derivAPI schema classes to convert request and response
    return call(
      'p2p_advertiser_adverts',
      req: {
        'limit': limit,
        'offset': offset,
      },
    );
  }

  Future<Map<String, dynamic>> p2pAgentUpdate(Map<String, dynamic> advertiser) {
    return call('p2p_advertiser_update', req: advertiser);
  }

  Future<Map<String, dynamic>> time() {
    return call('time');
  }

  Stream<BalanceResponse> subscribeBalance() {
    return subscribe('balance').map<BalanceResponse>(
        (final balance) => BalanceResponse.fromJson(balance));
  }

  Future<Map<String, dynamic>> logout() {
    return call('logout');
  }

  Stream<WebsiteStatusResponse> subscribeWebsiteStatus() {
    return subscribe('website_status').map<WebsiteStatusResponse>(
      (final status) => WebsiteStatusResponse.fromJson(status),
    );
  }
}
