import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'package:meta/meta.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/call_history.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_manager.dart';

/// This class is for handling Binary API connection and calling Binary APIs
class BinaryAPI implements BaseAPI {
  /// Indicates current connection status - only set `true` once
  /// we have established SSL *and* web socket handshake steps
  bool _connected = false;

  /// Represents the active web socket connection
  IOWebSocketChannel _webSocketChannel;

  /// Stream subscription to API data
  StreamSubscription<Map<String, dynamic>> _webSocketListener;

  /// Call manager instance
  CallManager _callManager;

  /// Subscription manager instance
  SubscriptionManager _subscriptionManager;

  /// Gets API call history
  CallHistory get callHistory => _callManager?.callHistory;

  /// Gets API subscription history
  CallHistory get subscriptionHistory => _subscriptionManager?.callHistory;

  @override
  Future<void> connect(
    ConnectionInformation connectionInformation, {
    ConnectionCallback onDone,
    ConnectionCallback onOpen,
  }) async {
    _connected = false;

    final Uri uri = Uri(
      scheme: 'wss',
      host: connectionInformation.endpoint,
      path: '/websockets/v3',
      queryParameters: <String, dynamic>{
        // The Uri.queryParameters only accept Map<String, dynamic/*String|Iterable<String>*/>
        'app_id': connectionInformation.appId,
        'l': connectionInformation.language,
        'brand': connectionInformation.brand,
      },
    );

    dev.log('connecting to $uri.');

    final Completer<bool> connectionCompleter = Completer<bool>();

    // Initialize connection to web socket server
    _webSocketChannel = IOWebSocketChannel.connect(uri.toString());

    _webSocketListener =
        _webSocketChannel // .cast<String>().transform(utf8.decode)
            .stream
            .map<Map<String, dynamic>>((Object result) => jsonDecode(result))
            .listen(
              (Map<String, dynamic> message) =>
                  _handleResponse(connectionCompleter, message),
              onError: (Object error) =>
                  dev.log('the web socket connection is closed: $error.'),
              onDone: () async {
                dev.log('web socket is closed.');

                _connected = false;

                if (onDone != null) {
                  onDone();
                }
              },
            );

    dev.log('send initial message.');

    await call(request: const PingRequest());
    await connectionCompleter.future;

    dev.log('web socket is connected.');

    if (onOpen != null) {
      onOpen();
    }
  }

  @override
  void addToChannel(Map<String, dynamic> request) {
    _webSocketChannel.sink.add(utf8.encode(jsonEncode(request)));
  }

  @override
  Future<Response> call({
    @required Request request,
  }) =>
      (_callManager ??= CallManager(this))(
        request: request,
      );

  @override
  Stream<Response> subscribe({
    @required Request request,
    int cacheSize = 0,
    RequestCompareFunction comparePredicate,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this))(
        request: request,
        cacheSize: cacheSize,
        comparePredicate: comparePredicate,
      );

  @override
  Future<ForgetResponse> unsubscribe({
    @required String subscriptionId,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this)).unsubscribe(
        subscriptionId: subscriptionId,
      );

  @override
  Future<ForgetAllResponse> unsubscribeAll({
    @required ForgetStreamType method,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this)).unsubscribeAll(
        method: method,
      );

  @override
  Future<void> disconnect() async {
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

      dev.log('and we cast to: ${message.runtimeType}');

      if (!_connected) {
        dev.log('web socket is connected.');

        _connected = true;
        connectionCompleter.complete(true);
      }

      dev.log('api response: $message.');
      dev.log('check for req_id in received message.');

      if (message.containsKey('req_id')) {
        dev.log('have req_id in received message:');
        dev.log(message['req_id'].runtimeType.toString());

        final int requestId = message['req_id'];

        dev.log('have request id: $requestId.');

        if (_callManager?.contains(requestId) ?? false) {
          _callManager.handleResponse(
            requestId: requestId,
            response: message,
          );
        } else if (_subscriptionManager?.contains(requestId) ?? false) {
          _subscriptionManager.handleResponse(
            requestId: requestId,
            response: message,
          );
        } else {
          dev.log(
            'this has a request id, but does not match anything in our pending queue.',
          );
        }
      } else {
        dev.log('no req_id, ignoring.');
      }
    } on Exception catch (e) {
      dev.log('failed to process $response - $e', error: e);
    }
  }
}
