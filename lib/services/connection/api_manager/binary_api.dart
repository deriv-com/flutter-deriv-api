import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter/widgets.dart';
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

/// This class is for handling Binary API connection and calling Binary APIs.
class BinaryAPI extends BaseAPI {
  /// Initializes binary api.
  BinaryAPI({UniqueKey? uniqueKey})
      : super(uniqueKey: uniqueKey ?? UniqueKey());

  static const Duration _disconnectTimeOut = Duration(seconds: 5);
  static const Duration _websocketConnectTimeOut = Duration(seconds: 10);

  /// Represents the active web socket connection.
  IOWebSocketChannel? _webSocketChannel;

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

  @override
  Future<void> connect(
    ConnectionInformation? connectionInformation, {
    ConnectionCallback? onOpen,
    ConnectionCallback? onDone,
    ConnectionCallback? onError,
    bool printResponse = false,
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

    dev.log('$runtimeType $uniqueKey connecting to $uri.');

    await _setUserAgent();

    // Initialize connection to web socket server.
    _webSocketChannel = IOWebSocketChannel.connect(
      '$uri',
      pingInterval: _websocketConnectTimeOut,
    );

    _webSocketListener = _webSocketChannel?.stream
        .map<Map<String, dynamic>?>((Object? result) => jsonDecode('$result'))
        .listen(
      (Map<String, dynamic>? message) {
        onOpen?.call(uniqueKey);

        if (message != null) {
          _handleResponse(message, printResponse: printResponse);
        }
      },
      onDone: () async {
        dev.log('$runtimeType $uniqueKey web socket is closed.');

        onDone?.call(uniqueKey);
      },
      onError: (Object error) {
        dev.log(
          '$runtimeType $uniqueKey the web socket connection is closed: $error.',
        );

        onError?.call(uniqueKey);
      },
    );

    dev.log('$runtimeType $uniqueKey send initial message.');
  }

  void _resetCallManagers() {
    _callManager = CallManager(this);
    _subscriptionManager = SubscriptionManager(this);
  }

  @override
  void addToChannel(Map<String, dynamic> request) =>
      _webSocketChannel?.sink.add(utf8.encode(jsonEncode(request)));

  @override
  Future<T> call<T>({required Request request}) async {
    final Response response = await (_callManager ??= CallManager(this))(
      request: request,
    );

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
      dev.log('$runtimeType $uniqueKey disconnect error', error: e);
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
      dev.log('$runtimeType $uniqueKey web socket is connected.');

      // Make sure that the received message is a map and it's parsable otherwise it throws an exception.
      final Map<String, dynamic> message = Map<String, dynamic>.from(response);

      if (printResponse) {
        dev.log('$runtimeType $uniqueKey api response: $message.');
      }

      if (message.containsKey('req_id')) {
        final int requestId = message['req_id'];

        if (printResponse) {
          dev.log('$runtimeType $uniqueKey have request id: $requestId.');
        }

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
          dev.log(
            '$runtimeType $requestId, does not match anything in our pending queue.',
          );
        }
      } else {
        dev.log('$runtimeType $uniqueKey no req_id, ignoring.');
      }
    } on Exception catch (e) {
      dev.log(
        '$runtimeType $uniqueKey failed to process $response - $e',
        error: e,
      );
    }
  }

  Future<void> _setUserAgent() async {
    final String userAgent = await getUserAgent();

    if (userAgent.isNotEmpty) {
      WebSocket.userAgent = userAgent;
    }
  }
}
