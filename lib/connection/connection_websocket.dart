library wsapi;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter_deriv_api/api/api.helper.dart';
import 'package:flutter_deriv_api/api/forget_all_receive.dart';
import 'package:flutter_deriv_api/api/forget_all_send.dart';
import 'package:flutter_deriv_api/api/forget_receive.dart';
import 'package:flutter_deriv_api/api/forget_send.dart';
import 'package:flutter_deriv_api/api/ping_send.dart';
import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/connection/subscription_stream.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/authorize_send.dart';

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

  /// Calls the WebSocket API with the given method name and parameters.
  Future<Response> _call(
    Request request, {
    bool subscribeCall = false,
  }) {
    request.reqId = nextRequestId();

    final Map<String, dynamic> req = request.toJson()
      // Trims the req since the api serialization doesn't work properly.
      ..removeWhere((String key, dynamic value) => value == null);
    // Allow caller to specify their own request ID
    //  ..putIfAbsent('req_id', nextRequestId)
    // Some methods pass a specific value for the method name, e.g. ticks => 'frxUSDJPY'
    //..putIfAbsent(method, () => 1);

    if (subscribeCall) {
      req.putIfAbsent('subscribe', () => 1);
    }

    final Completer<Response> f = Completer<Response>();
    pendingRequests[req['req_id']] =
        PendingRequest<Response>(request: req, response: f);

    dev.log('Queuing outgoing request', error: jsonEncode(req));

    final List<int> data = utf8.encode(jsonEncode(req));
    history.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: req,
      method: 'method',
    );

    chan.sink.add(data);

    return f.future;
  }

  /// Normal API call without subscription
  Future<Response> call(Request request) => _call(request);

  /// Calls the API method with subscribe set to '1' and return the stream
  /// to caller for responses
  Stream<Response> subscribe(Request request) {
    final SubscriptionStream<Response> subscriptionStream =
        SubscriptionStream<Response>();

    _call(request, subscribeCall: true);

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
    final Response response =
        await _call(ForgetRequest(forget: pendingRequest.subscriptionId));

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
        await _call(ForgetAllRequest(forgetAll: method));

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
    String endpoint = 'www.binaryqa10.com',
    String language = 'en',
    String brand = 'deriv',
    String appId = '1014',
  }) async {
    _connected = false;

    final Uri uri = Uri(
      scheme: 'wss',
      host: endpoint,
      path: '/websockets/v3',
      queryParameters: <String, dynamic>{
        // The Uri.queryParameters only accept Map<String, dynamic/*String|Iterable<String>*/>
        'app_id': appId,
        'l': language,
        'brand': brand,
      },
    );

    dev.log('Connecting to $uri');
    print('Connecting to $uri');

    final Completer<bool> connectionCompleter = Completer<bool>();

    // initialize connection to WebSocket server
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
    await _call(PingRequest());
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
      authResponse = await _call(authorizeRequest);

      print('Auth response is $authResponse');
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw Exception(e);
    }

    return authResponse;
  }
}
