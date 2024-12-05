import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_deriv_api/api/response/ping_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_config.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/timer/exponential_back_off_timer.dart';
import 'package:flutter_system_proxy/flutter_system_proxy.dart';
import 'package:web_socket_channel/io.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/call_history.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/exceptions/call_manager_exception.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'timer/connection_timer.dart';

/// This class is for handling Binary API connection and calling Binary APIs.
class BinaryAPI extends BaseAPI {
  /// Initializes [BinaryAPI] instance.
  BinaryAPI({
    String? key,
    ConnectionTimer? connectionTimer,
    this.connectionConfig = const ConnectionConfig(),
  }) : super(
          key: key ?? '${UniqueKey()}',
          enableDebug: connectionConfig.enableDebug,
        ) {
    _connectionTimer = connectionTimer ??
        ExponentialBackoffTimer(
          initialInterval: const Duration(milliseconds: 50),
          maxInterval: const Duration(seconds: 5),
          onDoAction: _ping,
          maxAttempts: 10,
        );
  }

  static const Duration _disconnectTimeOut = Duration(seconds: 5);

  // Instead of the 5-sec ping timer which we had in ConnectionCubit that is
  // removed, we are using the 5-sec ping interval for the WebSocketChannel.
  static const Duration _keepAlivePingInterval = Duration(seconds: 5);

  /// Represents the active websocket connection.
  ///
  /// This is used to send and receive data from the websocket server.
  IOWebSocketChannel? _webSocketChannel;

  /// Connection configuration.
  final ConnectionConfig connectionConfig;

  /// Stream subscription to API data.
  StreamSubscription<Map<String, dynamic>?>? _webSocketListener;

  /// Call manager instance.
  CallManager? _callManager;

  /// Subscription manager instance.
  SubscriptionManager? _subscriptionManager;

  /// Gets API call history.
  CallHistory? get callHistory => _callManager?.callHistory;

  /// Gets API subscription history.
  CallHistory? get subscriptionHistory => _subscriptionManager?.callHistory;

  /// A timer to schedule sending ping requests right after the WebSocket is
  /// ready to receive the first response from the server. This helps ensure
  /// that the connection is established.
  ///
  /// Ideally, we would use the [WebSocketChannel.ready] future to determine
  /// if the connection is ready to send and receive messages. However, it
  /// doesn't always work as expected. In testing, we noticed that even after
  /// the `ready` future completes, we often don't receive a response from the
  /// server.
  ///
  /// Until we find a better solution to make [WebSocketChannel.ready] more
  /// reliable, we rely on the incoming stream to wait for and receive the first
  /// `pong` response, which confirms that the connection is established.
  late final ConnectionTimer _connectionTimer;

  @override
  Future<void> connect(
    ConnectionInformation? connectionInformation, {
    ConnectionCallback? onOpen,
    ConnectionCallback? onDone,
    ConnectionCallback? onError,
  }) async {
    _resetCallManagers();

    final Uri uri = Uri(
      scheme: 'wss',
      host: connectionInformation!.endpoint,
      path: '/websockets/v3',
      queryParameters: <String, dynamic>{
        // The Uri.queryParameters only accept Map<String, dynamic/*String|Iterable<String>*/>.
        'app_id': connectionInformation.appId,
        'l': connectionInformation.language,
        'brand': connectionInformation.brand,
      },
    );

    _logDebugInfo('connecting to $uri.');

    await _setUserAgent();

    HttpClient? client;

    if (connectionConfig.proxyAwareConnection) {
      final String proxy = await FlutterSystemProxy.findProxyFromEnvironment(
          uri.toString().replaceAll('wss', 'https'));

      client = HttpClient()
        ..userAgent = WebSocket.userAgent
        ..findProxy = (Uri uri) => proxy;
    }

    // Initialize connection to websocket server.
    _webSocketChannel = IOWebSocketChannel.connect('$uri',
        pingInterval: _keepAlivePingInterval, customClient: client);

    unawaited(_webSocketChannel?.ready.then((_) => _startConnectionTimer()));

    _webSocketListener = _webSocketChannel?.stream
        .map<Map<String, dynamic>?>((Object? result) => jsonDecode('$result'))
        .listen(
      (Map<String, dynamic>? message) {
        onOpen?.call(key);
        _stopConnectionTimer();
        if (message != null) {
          _handleResponse(
            message,
            printResponse:
                connectionConfig.enableDebug && connectionConfig.printResponse,
          );
        }
      },
      onDone: () async {
        _logDebugInfo('the websocket is closed.');

        onDone?.call(key);
      },
      onError: (Object error) {
        _logDebugInfo(
          'the websocket connection is closed with error.',
          error: error,
        );

        onError?.call(key);
      },
    );

    _logDebugInfo('send initial message.');
  }

  void _resetCallManagers() {
    _callManager = CallManager(this);
    _subscriptionManager = SubscriptionManager(this);
  }

  @override
  void addToChannel(Map<String, dynamic> request) {
    try {
      _webSocketChannel?.sink.add(utf8.encode(jsonEncode(request)));
      // ignore: avoid_catches_without_on_clauses
    } catch (error) {
      _logDebugInfo('error while adding to channel.', error: error);
    }
  }

  @override
  Future<T> call<T>({
    required Request request,
    List<String> nullableKeys = const <String>[],
  }) async {
    final Future<Response> responseFuture =
        (_callManager ??= CallManager(this))(
      request: request,
      nullableKeys: nullableKeys,
    );

    final Response response = await (connectionConfig.callTimeout != null
        ? responseFuture.timeout(connectionConfig.callTimeout!)
        : responseFuture);

    if (response is T) {
      return response as T;
    }

    throw CallManagerException(message: 'Unexpected response');
  }

  @override
  Stream<Response>? subscribe({
    required Request request,
    int cacheSize = 0,
    RequestCompareFunction? comparePredicate,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this))(
        request: request,
        cacheSize: cacheSize,
        comparePredicate: comparePredicate,
      );

  @override
  Future<ForgetReceive> unsubscribe({required String subscriptionId}) =>
      (_subscriptionManager ??= SubscriptionManager(this)).unsubscribe(
        subscriptionId: subscriptionId,
      );

  @override
  Future<ForgetAllReceive> unsubscribeAll({
    required ForgetStreamType method,
  }) =>
      (_subscriptionManager ??= SubscriptionManager(this))
          .unsubscribeAll(method: method);

  @override
  Future<void> disconnect() async {
    try {
      await _webSocketListener?.cancel();

      await _webSocketChannel?.sink.close().timeout(
            _disconnectTimeOut,
            onTimeout: () => throw TimeoutException('Could not close sink.'),
          );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      _logDebugInfo('disconnect error.', error: e);
    } finally {
      _webSocketListener = null;
      _webSocketChannel = null;
    }
  }

  /// Handles responses that come from server, by using its reqId,
  /// and completes caller's Future or add the response to caller's stream if it was a subscription call.
  void _handleResponse(
    Map<String, dynamic> response, {
    required bool printResponse,
  }) {
    try {
      _logDebugInfo('the websocket is connected.');

      // Make sure that the received message is a map and it's parsable otherwise it throws an exception.
      final Map<String, dynamic> message = Map<String, dynamic>.from(response);

      if (printResponse) {
        _logDebugInfo('api response: $message.');
      }

      if (message.containsKey('req_id')) {
        final int requestId = message['req_id'];

        _logDebugInfo('have request id: $requestId.');

        if (_callManager?.contains(requestId) ?? false) {
          _callManager!.handleResponse(
            requestId: requestId,
            response: message,
          );
        } else if (_subscriptionManager?.contains(requestId) ?? false) {
          _subscriptionManager!.handleResponse(
            requestId: requestId,
            response: message,
          );
        } else {
          _logDebugInfo(
            '$runtimeType $requestId, does not match anything in our pending queue.',
          );
        }
      } else {
        _logDebugInfo('no req_id, ignoring.');
      }
    } on Exception catch (e) {
      _logDebugInfo('failed to process $response.', error: e);
    }
  }

  Future<void> _setUserAgent() async {
    final String userAgent = await getUserAgent();

    if (userAgent.isNotEmpty) {
      WebSocket.userAgent = userAgent;
    }
  }

  void _startConnectionTimer() {
    if (!_connectionTimer.isActive) {
      _connectionTimer.start();
    }
  }

  Future<void> _stopConnectionTimer() async {
    if (_connectionTimer.isActive) {
      _connectionTimer.stop();
    }
  }

  void _ping() => PingResponse.pingMethod();

  void _logDebugInfo(String message, {Object? error}) {
    if (enableDebug) {
      dev.log('$runtimeType $key $message', error: error);
    }
  }
}
