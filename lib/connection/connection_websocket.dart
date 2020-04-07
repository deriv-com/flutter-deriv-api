library wsapi;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/ping_send.dart';
import 'package:flutter_deriv_api/api/api.helper.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/connection/api_history.dart';
import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/subscription_manager.dart';

/// Callbacks for WS connection
typedef SocketCallback = void Function();

/// contains the API call
class BinaryApi {
  /// Indicates current connection status - only set `true` once
  /// we have established SSL *and* WebSocket handshake steps
  bool _connected = false;

  /// Represents the active WebSocket connection
  IOWebSocketChannel webSocketChannel;

  /// stream subscription to API date
  StreamSubscription<Map<String, dynamic>> webSocketListener;

  /// Tracks our internal counter for requests, always increments until the connection is closed
  int lastRequestId = 0;

  /// Any requests that are currently in-flight
  final Map<int, PendingRequest<Response>> _pendingRequests =
      <int, PendingRequest<Response>>{};

  /// All requests and responses
  final ApiHistory history = ApiHistory();

  /// Calls the WebSocket API with the given method name and parameters.
  Future<Response> call(
    Request request, {
    bool subscribeCall = false,
  }) {
    final int requestId = request.reqId = _nextRequestId();
    final Completer<Response> response = Completer<Response>();
    final Map<String, dynamic> preparedRequest = request.toJson()
      ..removeWhere((String key, dynamic value) => value == null);

    if (subscribeCall) {
      preparedRequest.putIfAbsent('subscribe', () => 1);

      SubscriptionManage().add(
        requestId: requestId,
        request: preparedRequest,
        response: response,
      );
    } else {
      _pendingRequests[requestId] = PendingRequest<Response>(
        request: preparedRequest,
        response: response,
      );
    }

    dev.log('Queuing outgoing request', error: jsonEncode(preparedRequest));

    final List<int> data = utf8.encode(jsonEncode(preparedRequest));

    history.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: preparedRequest,
      method: 'method',
    );

    webSocketChannel.sink.add(data);

    return response.future;
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
    webSocketChannel = IOWebSocketChannel.connect(uri.toString());

    webSocketListener =
        webSocketChannel // .cast<String>().transform(utf8.decode)
            .stream
            .map<Map<String, dynamic>>((Object str) => jsonDecode(str))
            .listen(
              (Map<String, dynamic> message) =>
                  _handleResponse(connectionCompleter, message),
              onError: (Object error) =>
                  print('The WS connection is closed: $error'),
              onDone: () async {
                print('WS is Closed!');

                _connected = false;

                if (onDone != null) {
                  onDone();
                }
              },
            );

    print('Send initial message');

    await call(PingRequest());
    await connectionCompleter.future;

    print('WS is connected!');

    if (onOpen != null) {
      onOpen();
    }

    return webSocketChannel;
  }

  /// Closes the stream channels related to WS
  Future<void> close() async {
    // The onDone function of the listener is set to null intentionally
    // to prevent it from being invoked after destroying the WebSocket object.
    webSocketListener
      ..onDone(null)
      ..onError(null);

    await webSocketListener.cancel();

    if (_connected) {
      await webSocketChannel.sink.close(status.goingAway);
    }

    webSocketListener = null;
    webSocketChannel = null;
  }

  /// Calls the authorize method with the giver [token]
  Future<Response> authorize(String token) async {
    Response authResponse;

    try {
      final AuthorizeRequest authorizeRequest = AuthorizeRequest()
        ..authorize = token;

      print('Auth Request is ${authorizeRequest.toJson()}');

      authResponse = await call(authorizeRequest);

      print('Auth response is $authResponse');
    } on Exception catch (e, stackTrace) {
      print(e);
      print(stackTrace);

      throw Exception(e);
    }

    return authResponse;
  }

  /// Generates reqId for the next request which is going to be sent to server
  /// Each API call can have a reqID which can be used to identifying its
  /// response (Its response will have the same reqId)
  int _nextRequestId() {
    dev.log('Assigning ID, last was $lastRequestId');

    return ++lastRequestId;
  }

  /// Handles responses that come from server, by using its reqId, and completes
  /// caller's Future or add the response to caller's stream if it was a
  /// subscription call
  void _handleResponse(
    Completer<bool> connectionCompleter,
    Map<String, dynamic> response,
  ) {
    try {
      dev.log('Have message', error: response.runtimeType);

      // Make sure that the received message is a map and it's parsable otherwise it throws an exception
      final Map<String, dynamic> message = Map<String, dynamic>.from(response);

      print('and we cast to ');
      print(message.runtimeType);

      if (!_connected) {
        print('WS is connected');

        _connected = true;
        connectionCompleter.complete(true);
      }

      history.pushIncoming(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        method:
            message.containsKey('msg_type') ? message['msg_type'] : 'unknown',
        message: message,
      );

      print('API response: $message');
      print('Check for req_id in received message');

      if (message.containsKey('req_id')) {
        print('Have req_id in received message:');
        print(message['req_id'].runtimeType);

        final int requestId = message['req_id'];

        print('Have request ID ${requestId.toString()}');

        if (_pendingRequests.containsKey(requestId)) {
          _handleRequestResponse(requestId, message);
        } else if (SubscriptionManage().contains(requestId)) {
          SubscriptionManage().handleStreamResponse(
            requestId: requestId,
            response: message,
          );
        } else {
          print(
            'This has a request ID, but does not match anything in our pending queue',
          );
        }
      } else {
        print('No req_id, ignoring');
      }
    } on Exception catch (e) {
      print('Failed to process $response - $e');
    }
  }

  void _handleRequestResponse(int requestId, Map<String, dynamic> response) {
    print('Completing request for ${requestId.toString()}');

    final Completer<Response> requestCompleter =
        _pendingRequests[requestId].response;

    if (!requestCompleter.isCompleted) {
      requestCompleter.complete(getResponseByMsgType(response));
    }

    // Removes the pendingRequest when it's not a subscription, the subscription requests will be remove after unsubscribing.
    _pendingRequests.remove(requestId);

    print('Completed request');
  }
}
