library wsapi;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_deriv_api/api/helper/api_helper.api.dart';
import 'package:flutter_deriv_api/api/forget_all_receive.dart';
import 'package:flutter_deriv_api/api/forget_all_send.dart';
import 'package:flutter_deriv_api/api/forget_receive.dart';
import 'package:flutter_deriv_api/api/forget_send.dart';
import 'package:flutter_deriv_api/api/get_settings_send.dart';
import 'package:flutter_deriv_api/api/logout_receive.dart';
import 'package:flutter_deriv_api/api/logout_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_create_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advert_create_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_info_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advert_info_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_list_send.dart';
import 'package:flutter_deriv_api/api/p2p_advert_update_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advert_update_send.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_adverts_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_adverts_send.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_info_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_info_send.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_update_receive.dart';
import 'package:flutter_deriv_api/api/p2p_advertiser_update_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_cancel_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_cancel_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_confirm_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_confirm_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_create_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_create_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_info_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_info_send.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_receive.dart';
import 'package:flutter_deriv_api/api/p2p_order_list_send.dart';
import 'package:flutter_deriv_api/api/ping_send.dart';
import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/website_status_send.dart';
import 'package:flutter_deriv_api/connection/subscription_stream.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/balance_send.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/api/balance_receive.dart';
import 'package:flutter_deriv_api/api/get_settings_receive.dart';
import 'package:flutter_deriv_api/api/website_status_receive.dart';

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
  StreamSubscription<Map<String, dynamic>> wsListener;

  /// Tracks our internal counter for requests, always increments until the connection is closed
  int lastRequestId = 0;

  /// Any requests that are currently in-flight
  Map<int, PendingRequest<Response>> pendingRequests =
      <int, PendingRequest<Response>>{};

  /// All requests and responses
  final APIHistory history = APIHistory();

  /// Target endpoint - can be:
  ///
  /// - a full URL
  /// - a hostname
  /// - qaXX
  String get endpoint =>
      /*parseWSUrl(PrefService.getString('endpoint')) ?? */ 'blue.binaryws.com';

  /// Which application this is - the default
  /// is our OTC cashier in production
  String get appID => /*PrefService.getString('appId') ?? */ '1015';

  /// The language that should be used to show the context.
  String get language => /*PrefService.getString('language') ??*/ 'en';

  /// The brand name
  String brand = 'deriv';

  /// Calls the WebSocket API with the given method name and parameters.
  Future<Response> _call(
    final String method,
    Request request, {
    bool subscribeCall = false,
  }) {
    request.reqId = nextRequestId();

    final Map<String, dynamic> req = request.toJson()
      // Trims the req since the api serialization doesn't work properly.
      ..removeWhere((String key, dynamic value) => value == null)
      // Allow caller to specify their own request ID
      //  ..putIfAbsent('req_id', nextRequestId)
      // Some methods pass a specific value for the method name, e.g. ticks => 'frxUSDJPY'
      ..putIfAbsent(method, () => 1);

    if (subscribeCall) {
      req.putIfAbsent('subscribe', () => 1);
    }

    final Completer<Response> f = Completer<Response>();
    pendingRequests[req['req_id']] =
        PendingRequest<Response>(method: method, request: req, response: f);

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

  /// Normal API call without subscription
  Future<Response> call(String method, Request request) =>
      _call(method, request);

  /// Calls the API method with subscribe set to '1' and return the stream
  /// to caller for responses
  Stream<Response> subscribe(final String method, Request request) {
    final SubscriptionStream<Response> subscriptionStream =
        SubscriptionStream<Response>();

    _call(method, request, subscribeCall: true);

    pendingRequests[request.reqId]._streamController = subscriptionStream;

    return subscriptionStream.stream;
  }

  /// unsubscribe with a specific [subscriptionId]
  Future<ForgetResponse> unsubscribe(
    String subscriptionId, {
    bool shouldForced = false,
  }) async {
    final int reqId = pendingRequests.keys.singleWhere(
        (int id) => pendingRequests[id].subscriptionId == subscriptionId);

    final PendingRequest<Response> pendingRequest = pendingRequests[reqId];

    if (pendingRequest.streamController.hasListener && !shouldForced) {
      throw Exception('The stream has listener');
    }

    // Send forget request
    final Response response = await _call(
        'forget', ForgetRequest(forget: pendingRequest.subscriptionId));

    if (response.error != null) {
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

    final ForgetAllResponse response =
        await _call('forget_all', ForgetAllRequest(forgetAll: method));

    if (response.error != null) {
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
          final Completer<Response> requestCompleter =
              pendingRequests[reqId].response;

          if (!requestCompleter.isCompleted) {
            final Response response = getResponseByMsgType(m);
            requestCompleter.complete(response);
          }

          // Checks if the request was a subscription or not.
          if (pendingRequests[reqId].streamController != null) {
            // Adds the subscription id to the pendingRequest object for further references.
            if (m.containsKey('subscription')) {
              pendingRequests[reqId]._subscriptionId = m['subscription']['id'];
            }

            // Broadcasts the new message into the stream.
            pendingRequests[reqId]
                .streamController
                .add(getResponseByMsgType(m));
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
        'app_id': '1014',
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
        .map<Map<String, dynamic>>((Object str) => jsonDecode(str))
        .listen((Map<String, dynamic> message) {
      handleResponse(connectionCompleter, message);
    }, onError: (Object error) {
      print('The WS connection is closed: $error');
    }, onDone: () async {
      print('WS is Closed!');
      _connected = false;
      if (onDone != null) {
        onDone();
      }
    });

    print('Send initial message');
    await _call('ping', PingRequest());
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
  Future<Response> authorize(String token) async {
    Response authResponse;
    try {
      final AuthorizeRequest authorizeRequest = AuthorizeRequest()
        ..authorize = token;
      print('Auth Request is ${authorizeRequest.toJson()}');
      authResponse = await _call('authorize', authorizeRequest);

      print('Auth response is $authResponse');
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return authResponse;
  }

  /// Balance API call
  Future<BalanceResponse> balance() async {
    BalanceResponse balanceResponse;
    try {
      final BalanceRequest balanceReq = BalanceRequest();
      balanceResponse = await _call('balance', balanceReq);
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return balanceResponse;
  }

  /// GetSetting API call
  Future<GetSettingsResponse> getSetting() async {
    final GetSettingsResponse resp =
        await _call('get_settings', GetSettingsRequest());
    print('Account Settings: $resp');
    return resp;
  }

  /// Later, we should use derivAPI schema classes to convert request and response
  Future<Response> p2pAdvertList({
    final String accountCurrency,
    final String advertiserId,
    final double amount,
    final String country,
    final String counterpartyType,
    final int limit,
    final int offset,
  }) =>
      _call(
        'p2p_advert_list',
        P2pAdvertListRequest(
          accountCurrency: accountCurrency,
          counterpartyType: counterpartyType,
          country: country,
          advertiserId: advertiserId,
          offset: offset,
          limit: limit,
        ),
      );

  /// Calls p2p_advert_info for getting details of an advert based on the
  /// giver [id]
  Future<P2pAdvertInfoResponse> p2pAdvertInfo(String id) =>
      _call('p2p_advert_info', P2pAdvertInfoRequest(id: id));

  /// Calls p2p_order_create to place an order on the [advertId] with
  /// the [amount] specified
  Future<P2pOrderCreateResponse> p2pOrderCreate(
    String advertId,
    double amount,
  ) =>
      _call('p2p_order_create',
          P2pOrderCreateRequest(advertId: advertId, amount: amount));

  /// Calls p2p_advert_create (Allowed only for advertisers)
  Future<P2pAdvertCreateResponse> p2pAdvertCreate(
    Map<String, dynamic> advert,
  ) =>
      _call(
          'p2p_advert_create',
          P2pAdvertCreateRequest(
            type: advert['type'],
            amount: advert['amount'],
            maxOrderAmount: advert['max_order_amount'],
            paymentMethod: advert['payment_method'],
            minOrderAmount: advert['min_order_amount'],
            description: advert['description'],
            rate: advert['rate'],
          ));

  /// Cancel an order if possible
  Future<P2pOrderCancelResponse> p2pOrderCancel(String id) =>
      _call('p2p_order_cancel', P2pOrderCancelRequest(id: id));

  /// Edit an advert
  Future<P2pAdvertUpdateResponse> p2pAdvertUpdate(Map<String, dynamic> req) =>
      _call('p2p_advert_update', P2pAdvertUpdateRequest());

  /// Gets the list of orders
  /// if [advertId] specified will get the orders for that advert
  /// [isActive] only gets orders that are not completed, timed-out or canceled
  Future<Response> p2pOrderList(
          {String advertId, int offset, int limit, bool isActive}) =>
      _call(
          'p2p_order_list',
          P2pOrderListRequest(
            advertId: advertId,
            active: (isActive ?? false) ? 0 : 1,
            offset: offset,
            limit: limit,
          ));

  /// Subscribes to p2p_order_list
  Stream<P2pOrderListResponse> subscribeP2pOrderList(
          {String advertId, int offset, int limit, bool isHistorical}) =>
      subscribe(
          'p2p_order_list',
          P2pOrderListRequest(
            advertId: advertId,
            active: (isHistorical ?? false) ? 0 : 1,
            offset: offset,
            limit: limit,
          ));

  /// Gets the details of an order by its [id]
  Future<P2pOrderInfoResponse> p2pOrderInfo(String orderId) =>
      _call('p2p_order_info', P2pOrderInfoRequest(id: orderId));

  /// Subscribes to p2p_order_info
  Stream<P2pOrderInfoResponse> subscribeOrderInfo({String id}) =>
      subscribe('p2p_order_info', P2pOrderInfoRequest(id: id));

  /// Confirms an order, Either as a confirmation that is paid or released
  Future<P2pOrderConfirmResponse> p2pOrderConfirm(String id) =>
      _call('p2p_order_confirm', P2pOrderConfirmRequest(id: id));

  /// Gets the information of advertiser
  Future<P2pAdvertiserInfoResponse> p2pAdvertiserInfo(String id) =>
      _call('p2p_advertiser_info', P2pAdvertiserInfoRequest(id: id));

  /// Adverts for this advertiser who is logged in
  Future<P2pAdvertiserAdvertsResponse> p2pAdvertiserAdverts(
          {final int limit, final int offset}) =>
      _call('p2p_advertiser_adverts',
          P2pAdvertiserAdvertsRequest(limit: limit, offset: offset));

  /// Updates an advertiser
  Future<P2pAdvertiserUpdateResponse> p2pAdvertiserUpdate(
          Map<String, dynamic> advertiser) =>
      _call('p2p_advertiser_update',
          P2pAdvertiserUpdateRequest.fromJson(advertiser));

  /// Subscribes to account balance
  Stream<BalanceResponse> subscribeBalance() =>
      subscribe('balance', BalanceRequest()).map<BalanceResponse>(
          (final dynamic balance) => BalanceResponse.fromJson(balance));

  /// Logs out from WS
  Future<LogoutResponse> logout() => _call('logout', LogoutRequest());

  /// Subscribes to website_status
  Stream<WebsiteStatusResponse> subscribeWebsiteStatus() =>
      subscribe('website_status', WebsiteStatusRequest())
          .map<WebsiteStatusResponse>(
        (final dynamic status) => WebsiteStatusResponse.fromJson(status),
      );
}
