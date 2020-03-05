library wsapi;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_deriv_api/connection/subscription_stream.dart';
import 'package:preferences/preference_service.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/balance_send.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/api/balance_receive.dart';
import 'package:flutter_deriv_api/api/authorize_receive.dart';
import 'package:flutter_deriv_api/api/get_settings_receive.dart';
import 'package:flutter_deriv_api/api/website_status_receive.dart';

import '../helpers.dart';

/// Callbacks for WS connection
typedef SocketCallback = void Function();

/// Represent a pending request.
class PendingRequest<T> {
  /// Initializes
  PendingRequest({this.method, this.request, this.response});

  /// api call method (e.g. 'active_symbols')
  final String method;

  /// Map of the sent request
  final Map<String, dynamic> request;

  /// this completer will complete whenever the response of the request arrives
  final Completer<T> response;

  /// gets returned to the caller if its a subscription call
  SubscriptionStream<T> _streamController;

  /// ID of the subscription
  String _subscriptionId;

  /// true if subscribed
  bool get isSubscribed => _streamController != null;

  /// Stream If API call is subscribe mode
  SubscriptionStream<T> get streamController => _streamController;

  /// Subscription ID which returned from server
  String get subscriptionId => _subscriptionId;
}

/// Represents a message sent or received via the webSockets connection
class HistoryEntry {
  /// Initializes
  HistoryEntry({this.timeStamp, this.method, this.message});

  /// time stamp when is created
  final int timeStamp;

  /// API call method
  final String method;

  /// content of sent or received message
  final Object message;
}

/// Provides storage for messages sent/received via the WebSocket connection
class APIHistory {
  /// Messages that were sent to the remote endpoint
  final List<HistoryEntry> outgoing = <HistoryEntry>[];

  /// Messages that were received from the remote endpoint
  final List<HistoryEntry> incoming = <HistoryEntry>[];

  int _limit = 1000;

  /// Messages limit
  int get limit => _limit;

  set limit(int limit) {
    _limit = limit;
    trimIncoming();
    trimOutgoing();
  }

  /// Trim early entries from [outgoing] if we exceed the current limit
  void trimOutgoing() {
    if (outgoing.length >= limit) {
      outgoing.removeRange(0, (limit - outgoing.length) - 1);
    }
  }

  /// Trim early entries from [incoming] if we exceed the current limit
  void trimIncoming() {
    if (incoming.length >= limit) {
      incoming.removeRange(0, (limit - incoming.length) - 1);
    }
  }

  /// Record a message being sent to the remote endpoint
  void pushOutgoing({int timestamp, String method, Object message}) {
    outgoing.add(
        HistoryEntry(timeStamp: timestamp, method: method, message: message));
    trimOutgoing();
  }

  /// Record a message that was received from the remote endpoint
  void pushIncoming({int timestamp, String method, Object message}) {
    incoming.add(
        HistoryEntry(timeStamp: timestamp, method: method, message: message));
    trimIncoming();
  }
}

/// contains the API call
class BinaryAPI {
  /// Indicates current connection status - only set `true` once
  /// we have established SSL *and* WebSocket handshake steps
  bool _connected = false;

  /// Represents the active WebSocket connection
  IOWebSocketChannel chan;

  /// stream subscription to API date
  StreamSubscription<String> wsListener;

  /// Tracks our internal counter for requests, always increments until the connection is closed
  int lastRequestId = 0;

  /// Any requests that are currently in-flight
  Map<int, PendingRequest<Map<String, dynamic>>> pendingRequests =
      <int, PendingRequest<Map<String, dynamic>>>{};

  /// All requests and responses
  final APIHistory history = APIHistory();

  /// Target endpoint - can be:
  ///
  /// - a full URL
  /// - a hostname
  /// - qaXX
  String get endpoint =>
      parseWSUrl(PrefService.get('endpoint')) ?? 'blue.binaryws.com';

  /// Which application this is - the default
  /// is our OTC cashier in production
  String get appID => PrefService.get('appId') ?? '1015';

  /// The language that should be used to show the context.
  String get language => PrefService.get('language') ?? 'en';

  /// The brand name
  String brand = 'deriv';

  /// Calls the WebSocket API with the given method name and parameters.
  Future<dynamic> call(final String method, {Map<String, dynamic> req}) {
    req ??= <String, dynamic>{};

    req
      // Trims the req since the api serialization doesn't work properly.
      ..removeWhere((String key, dynamic value) => value == null)
      // Allow caller to specify their own request ID
      ..putIfAbsent('req_id', nextRequestId)
      // Some methods pass a specific value for the method name, e.g. ticks => 'frxUSDJPY'
      ..putIfAbsent(method, () => 1);

    final Completer<Map<String, dynamic>> f = Completer<Map<String, dynamic>>();
    pendingRequests[req['req_id']] = PendingRequest<Map<String, dynamic>>(
        method: method, request: req, response: f);

    dev.log('Queuing outgoing request', error: jsonEncode(req));

    final List<int> data = utf8.encode(jsonEncode(req));
    history.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: req,
      method: method,
    );

    chan.sink.add(data);

    return f.future;
  }

  /// Calls the API method with subscribe set to '1' and return the stream
  /// to caller for responses
  Stream<dynamic> subscribe(final String method, {Map<String, dynamic> req}) {
    req ??= <String, dynamic>{};

    req
      ..putIfAbsent('req_id', nextRequestId)
      ..putIfAbsent('subscribe', () => 1);

    final SubscriptionStream<Map<String, dynamic>> subscriptionStream =
        SubscriptionStream<Map<String, dynamic>>();

    call(method, req: req);

    pendingRequests[req['req_id']]._streamController = subscriptionStream;

    return subscriptionStream.stream;
  }

  /// unsubscribe with a specific [subscriptionId]
  Future<Map<String, dynamic>> unsubscribe(
    String subscriptionId, {
    bool shouldForced = false,
  }) async {
    final int reqId = pendingRequests.keys.singleWhere(
        (int id) => pendingRequests[id].subscriptionId == subscriptionId);

    final PendingRequest<Map<String, dynamic>> pendingRequest =
        pendingRequests[reqId];

    if (pendingRequest.streamController.hasListener && !shouldForced) {
      throw Exception('The stream has listener');
    }

    // Send forget request
    final Map<String, dynamic> response = await call('forget',
        req: <String, dynamic>{'forget': pendingRequest.subscriptionId});

    if (!response.containsKey('error')) {
      // Remove the the request from pending requests
      pendingRequests.remove(reqId);
      await pendingRequest.streamController.closeStream();
    }

    return response;
  }

  /// Unsubscribe to multiple [method]s all at once
  Future<dynamic> unsubscribeAll(String method,
      {bool shouldForced = false}) async {
    final List<int> reqIds = pendingRequests.keys.where((int id) =>
        pendingRequests[id].method == method &&
        pendingRequests[id].isSubscribed);

    final Map<String, dynamic> response =
        await call('forget_all', req: <String, dynamic>{'forget_all': method});

    if (!response.containsKey('error')) {
      for (int id in reqIds) {
        await pendingRequests[id].streamController.closeStream();
        pendingRequests.remove(id);
      }
    }

    return response;
  }

  /// Generates reqId for the next request which is going to be sent to server
  /// Each API call can have a reqID which can be used to identifying its
  /// response (Its response will have the same reqId)
  int nextRequestId() {
    dev.log('Assigning ID, last was $lastRequestId');
    return ++lastRequestId;
  }

  /// Handles responses that come from server, by using its reqId, and completes
  /// caller's Future or add the response to caller's stream if it was a
  /// subscription call
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
        print('Have request ID ${reqId.toString()}');
        if (pendingRequests.containsKey(reqId)) {
          print('Completing request for ${reqId.toString()}');
          final Completer<Map<String, dynamic>> requestCompleter =
              pendingRequests[reqId].response;

          if (!requestCompleter.isCompleted) {
            requestCompleter.complete(m);
          }

          // Checks if the request was a subscription or not.
          if (pendingRequests[reqId].streamController != null) {
            // Adds the subscription id to the pendingRequest object for further references.
            if (m.containsKey('subscription')) {
              pendingRequests[reqId]._subscriptionId = m['subscription']['id'];
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
    } on Exception catch (e) {
      print('Failed to process $msg - $e');
    }
  }

  /// Connects to binary web socket
  Future<IOWebSocketChannel> run({
    SocketCallback onDone,
    SocketCallback onOpen,
  }) async {
    _connected = false;

    final Uri uri = Uri(
      scheme: 'wss',
      host: 'www.binaryqa10.com',
      path: '/websockets/v3',
      queryParameters: <String, dynamic>{
        // The Uri.queryParameters only accept Map<String, dynamic/*String|Iterable<String>*/>
        'app_id': '1015',
        'l': language,
        'brand': brand,
      },
    );

    dev.log('Connecting to $uri');
    print('Connecting to $uri');

    final Completer<bool> connectionCompleter = Completer<bool>();

    // initialize ws server
    chan = IOWebSocketChannel.connect(uri.toString());

    wsListener = chan // .cast<String>().transform(utf8.decode)
        .stream
        .map<dynamic>((dynamic str) => jsonDecode(str))
        .listen((dynamic message) {
      handleResponse(connectionCompleter, message);
    }, onError: (Error error) {
      print('The WS connection is closed: $error');
    }, onDone: () async {
      print('WS is Closed!');
      _connected = false;
      if (onDone != null) {
        onDone();
      }
    });

    print('Send initial message');
    await call('ping');
    await connectionCompleter.future;
    print('WS is connected!');
    if (onOpen != null) {
      onOpen();
    }
    return chan;
  }

  /// Closes the stream channels related to WS
  Future<void> close() async {
    // The onDone function of the listener is set to null intentionally
    // to prevent it from being invoked after destroying the WebSocket object.
    wsListener
      ..onDone(null)
      ..onError(null);

    await wsListener.cancel();

    if (_connected) {
      await chan.sink.close(status.goingAway);
    }

    wsListener = null;
    chan = null;
  }

  /// Calls the authorize method with the giver [token]
  Future<AuthorizeResponse> authorize(String token) async {
    AuthorizeResponse authObj;
    try {
      final AuthorizeRequest authorizeRequest = AuthorizeRequest()
        ..authorize = token;
      print('Auth Request is ${authorizeRequest.toJson()}');
      final Map<String, dynamic> authRes =
          await call('authorize', req: authorizeRequest.toJson());

      print('Auth response is $authRes');

      authObj = AuthorizeResponse.fromJson(authRes);
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return authObj;
  }

  /// Balance API call
  Future<BalanceResponse> balance() async {
    BalanceResponse balanceResponse;
    try {
      final BalanceRequest balanceReq = BalanceRequest();
      final Map<String, dynamic> balanceRes =
          await call('balance', req: balanceReq.toJson());

      balanceResponse = BalanceResponse.fromJson(balanceRes);
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return balanceResponse;
  }

  /// GetSetting API call
  Future<GetSettingsResponse> getSetting() async {
    final Map<String, dynamic> resp = await call('get_settings');

    print('Account Settings: $resp');

    final GetSettingsResponse settings = GetSettingsResponse.fromJson(resp);

    return settings;
  }

  /// Later, we should use derivAPI schema classes to convert request and response
  Future<Map<String, dynamic>> p2pAdvertList({
    final String accountCurrency,
    final String advertiserId,
    final double amount,
    final String country,
    final String counterpartyType,
    final int limit,
    final int offset,
    final String targetCurrency,
  }) =>
      call(
        'p2p_advert_list',
        req: <String, dynamic>{
          'account_currency': accountCurrency,
          'counterparty_type': counterpartyType,
          'country': country,
          'target_currency': targetCurrency,
          'advertiser_id': advertiserId,
          'offset': offset,
          'limit': limit,
        },
      );

  /// Calls p2p_advert_info for getting details of an advert based on the
  /// giver [id]
  Future<Map<String, dynamic>> p2pAdvertInfo(int id,
      {double amount, bool subscribe}) {
    final Map<String, dynamic> req = <String, dynamic>{
      'amount': amount,
      'id': id
    };

    if (subscribe) {
      req['subscribe'] = 1;
    }
    return call('p2p_advert_info', req: req);
  }

  /// Calls p2p_order_create to place an order on the [advertId] with
  /// the [amount] specified
  Future<Map<String, dynamic>> p2pOrderCreate(String advertId, double amount,
      {bool subscribe = false}) {
    final Map<String, dynamic> req = <String, dynamic>{
      'amount': amount,
      'advert_id': advertId
    };

    if (subscribe) {
      req['subscribe'] = 1;
    }

    return call('p2p_order_create', req: req);
  }

  /// Calls p2p_advert_create (Allowed only for advertisers)
  Future<Map<String, dynamic>> p2pAdvertCreate(Map<String, dynamic> advert) {
    final Map<String, dynamic> req = <String, dynamic>{
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

  /// Cancel an order if possible
  Future<Map<String, dynamic>> p2pOrderCancel(String id) {
    final Map<String, dynamic> req = <String, dynamic>{'id': id};
    return call('p2p_order_cancel', req: req);
  }

  /// Edit an advert
  Future<Map<String, dynamic>> p2pAdvertUpdate(
    Map<String, dynamic> req,
  ) =>
      call('p2p_advert_update', req: req);

  /// Remove an advert
  Future<Map<String, dynamic>> p2pAdvertRemove(String id) =>
      call('p2p_advert_remove', req: <String, dynamic>{'id': id});

  /// Gets the list of orders
  /// if [advertId] specified will get the orders for that advert
  /// [isActive] only gets orders that are not completed, timed-out or canceled
  Future<Map<String, dynamic>> p2pOrderList(
          {int advertId, int offset, int limit, bool isActive}) =>
      call('p2p_order_list', req: <String, dynamic>{
        'advert_id': advertId,
        'active': (isActive ?? false) ? 0 : 1,
        if (offset != null) 'offset': offset,
        if (limit != null) 'limit': limit,
      });

  /// Subscribes to p2p_order_list
  Stream<Map<String, dynamic>> subscribeP2pOrderList(
          {int advertId, int offset, int limit, bool isHistorical}) =>
      subscribe('p2p_order_list', req: <String, dynamic>{
        'advert_id': advertId,
        'active': (isHistorical ?? false) ? 0 : 1,
        if (offset != null) 'offset': offset,
        if (limit != null) 'limit': limit,
      });

  /// Gets the details of an order by its [id]
  Future<Map<String, dynamic>> p2pOrderInfo({String id}) =>
      call('p2p_order_info', req: <String, dynamic>{
        'id': id,
      });

  /// Subscribes to p2p_order_info
  Stream<Map<String, dynamic>> subscribeOrderInfo({String id}) =>
      subscribe('p2p_order_info', req: <String, dynamic>{'id': id});

  /// Confirms an order, Either as a confirmation that is paid or released
  Future<Map<String, dynamic>> p2pOrderConfirm(String id,
      {Map<String, dynamic> options}) {
    options ??= <String, dynamic>{};
    options['id'] = id;

    return call('p2p_order_confirm', req: options);
  }

  /// Gets the information of advertiser
  Future<Map<String, dynamic>> p2pAdvertiserInfo(
          {Map<String, dynamic> options}) =>
      call('p2p_advertiser_info', req: options);

  /// Adverts for this advertiser who is logged in
  Future<Map<String, dynamic>> p2pAdvertiserAdverts(
          {final int limit, final int offset}) =>
      call('p2p_advertiser_adverts',
          req: <String, dynamic>{'limit': limit, 'offset': offset});

  /// Updates an advertiser
  Future<Map<String, dynamic>> p2pAdvertiserUpdate(
    Map<String, dynamic> advertiser,
  ) =>
      call('p2p_advertiser_update', req: advertiser);

  /// Gets the server time
  Future<Map<String, dynamic>> time() => call('time');

  /// Subscribes to account balance
  Stream<BalanceResponse> subscribeBalance() =>
      subscribe('balance').map<BalanceResponse>(
          (final dynamic balance) => BalanceResponse.fromJson(balance));

  /// Logs out from WS
  Future<Map<String, dynamic>> logout() => call('logout');

  /// Subscribes to website_status
  Stream<WebsiteStatusResponse> subscribeWebsiteStatus() =>
      subscribe('website_status').map<WebsiteStatusResponse>(
        (final dynamic status) => WebsiteStatusResponse.fromJson(status),
      );
}
