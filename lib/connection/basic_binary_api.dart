library wsapi;

import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/ping_send.dart';
import 'package:flutter_deriv_api/api/forget_receive.dart';
import 'package:flutter_deriv_api/connection/api_history.dart';
import 'package:flutter_deriv_api/connection/call_manager.dart';
import 'package:flutter_deriv_api/connection/base_call_manager.dart';
import 'package:flutter_deriv_api/connection/subscription_manager.dart';

/// Callbacks for WS connection
typedef SocketCallback = void Function();

/// Contains the api call
class BasicBinaryAPI {
  /// Indicates current connection status - only set `true` once
  /// we have established SSL *and* web socket handshake steps
  bool _connected = false;

  /// Represents the active web socket connection
  IOWebSocketChannel _webSocketChannel;

  /// Stream subscription to api date
  StreamSubscription<Map<String, dynamic>> _webSocketListener;

  /// Call manager instance
  CallManager _callManager;

  /// Subscription manager instance
  SubscriptionManager _subscriptionManager;

  /// All requests and responses
  final APIHistory _apiHistory = APIHistory();

  /// Get web socket channel
  IOWebSocketChannel get webSocketChannel => _webSocketChannel;

  /// Get api history
  APIHistory get apiHistory => _apiHistory;

  /// Get call manager instance
  CallManager get call => _callManager ??= CallManager(this);

  /// Subscribe to a [request]
  /// [predicate] indicates compare condition for current [request] and pending requests
  Stream<Response> subscribe({
    @required Request request,
    RequestPredicateFunction predicate,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this)).call(
        request: request,
        predicate: predicate,
      );

  /// Unsubscribe with a specific [subscriptionId]
  Future<ForgetResponse> unsubscribe({
    @required String subscriptionId,
    bool shouldForced = false,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this)).unsubscribe(
        subscriptionId: subscriptionId,
        shouldForced: shouldForced,
      );

  /// Unsubscribe to multiple [method]s all at once
  Future<ForgetResponse> unsubscribeAll({
    @required String method,
    bool shouldForced = false,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this)).unsubscribeAll(
        method: method,
        shouldForced: shouldForced,
      );

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

    dev.log('connecting to $uri.');
    print('connecting to $uri.');

    final Completer<bool> connectionCompleter = Completer<bool>();

    // Initialize connection to web socket server
    _webSocketChannel = IOWebSocketChannel.connect(uri.toString());

    _webSocketListener =
        _webSocketChannel // .cast<String>().transform(utf8.decode)
            .stream
            .map<Map<String, dynamic>>((Object str) => jsonDecode(str))
            .listen(
              (Map<String, dynamic> message) =>
                  _handleResponse(connectionCompleter, message),
              onError: (Object error) =>
                  print('the web socket connection is closed: $error.'),
              onDone: () async {
                print('web socket is closed.');

                _connected = false;

                if (onDone != null) {
                  onDone();
                }
              },
            );

    print('send initial message.');

    await call(request: const PingRequest());
    await connectionCompleter.future;

    print('web socket is connected.');

    if (onOpen != null) {
      onOpen();
    }

    return _webSocketChannel;
  }

  /// Closes the stream channels related to WS
  Future<void> close() async {
    // The onDone function of the listener is set to null intentionally
    // to prevent it from being invoked after destroying the web socket object.
    _webSocketListener
      ..onDone(null)
      ..onError(null);

    await _webSocketListener.cancel();

    if (_connected) {
      await _webSocketChannel.sink.close(status.goingAway);
    }

    _webSocketListener = null;
    _webSocketChannel = null;
  }

  /// Handles responses that come from server, by using its reqId, and completes
  /// caller's Future or add the response to caller's stream if it was a
  /// subscription call
  void _handleResponse(
    Completer<bool> connectionCompleter,
    Map<String, dynamic> response,
  ) {
    try {
      dev.log('have message: ', error: response.runtimeType);

      // Make sure that the received message is a map and it's parsable otherwise it throws an exception
      final Map<String, dynamic> message = Map<String, dynamic>.from(response);

      print('and we cast to: ${message.runtimeType}');

      if (!_connected) {
        print('web socket is connected.');

        _connected = true;
        connectionCompleter.complete(true);
      }

      _apiHistory.pushIncoming(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        method:
            message.containsKey('msg_type') ? message['msg_type'] : 'unknown',
        message: message,
      );

      print('api response: $message.');
      print('check for req_id in received message.');

      if (message.containsKey('req_id')) {
        print('have req_id in received message:');
        print(message['req_id'].runtimeType);

        final int requestId = message['req_id'];

        print('have request id: $requestId.');

        if (_callManager.contains(requestId)) {
          _callManager.handleResponse(
            requestId: requestId,
            response: message,
          );
        } else if (_subscriptionManager.contains(requestId)) {
          _subscriptionManager.handleResponse(
            requestId: requestId,
            response: message,
          );
        } else {
          print(
            'this has a request id, but does not match anything in our pending queue.',
          );
        }
      } else {
        print('no req_id, ignoring.');
      }
    } on Exception catch (e) {
      print('failed to process $response - $e');
    }
  }
}
