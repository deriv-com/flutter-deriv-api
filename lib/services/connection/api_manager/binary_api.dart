import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:isolate';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_deriv_api/api/exceptions/base_api_exception.dart';
import 'package:flutter_deriv_api/api/manually/tick.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/active_symbols_response_result.dart';
import 'package:flutter_deriv_api/api/response/authorize_response_result.dart';
import 'package:flutter_deriv_api/api/response/landing_company_response_result.dart';
import 'package:flutter_deriv_api/api/response/ticks_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/active_symbols_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_system_proxy/flutter_system_proxy.dart';
import 'package:rxdart/rxdart.dart';
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

part 'isolate_events.dart';

part 'isolate_task.dart';

/// This class is for handling Binary API connection and calling Binary APIs.
class BinaryAPI extends BaseAPI {
  /// Initializes [BinaryAPI] instance.
  BinaryAPI({
    String? key,
    bool enableDebug = false,
    this.proxyAwareConnection = false,
  }) : super(key: key ?? '${UniqueKey()}', enableDebug: enableDebug);

  static const Duration _disconnectTimeOut = Duration(seconds: 5);
  static const Duration _websocketConnectTimeOut = Duration(seconds: 10);

  /// A flag to indicate if the connection is proxy aware.
  final bool proxyAwareConnection;

  /// Represents the active websocket connection.
  ///
  /// This is used to send and receive data from the websocket server.
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

    _logDebugInfo('connecting to $uri.');

    await _setUserAgent();

    HttpClient? client;

    if (proxyAwareConnection) {
      final String proxy = await FlutterSystemProxy.findProxyFromEnvironment(
          uri.toString().replaceAll('wss', 'https'));

      client = HttpClient()
        ..userAgent = WebSocket.userAgent
        ..findProxy = (Uri uri) => proxy;
    }

    // Initialize connection to websocket server.
    _webSocketChannel = IOWebSocketChannel.connect('$uri',
        pingInterval: _websocketConnectTimeOut, customClient: client);

    _webSocketListener = _webSocketChannel?.stream
        .map<Map<String, dynamic>?>((Object? result) => jsonDecode('$result'))
        .listen(
      (Map<String, dynamic>? message) {
        onOpen?.call(key);

        if (message != null) {
          _handleResponse(message, printResponse: printResponse);
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
    final Response response = await (_callManager ??= CallManager(this))(
      request: request,
      nullableKeys: nullableKeys,
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

  void _logDebugInfo(String message, {Object? error}) {
    if (enableDebug) {
      dev.log('$runtimeType $key $message', error: error);
    }
  }
}

/// This class is for handling Binary API connection and calling Binary APIs.
class IsolateWrappingAPI extends BaseAPI {
  /// Initializes [BinaryAPI] instance.
  IsolateWrappingAPI({
    String? key,
    bool enableDebug = false,
    this.proxyAwareConnection = false,
  }) : super(key: key ?? '${UniqueKey()}', enableDebug: enableDebug) {
    _canStartCompleter = Completer<void>();

    Isolate.spawn<IsolateConfig>(
      _isolateTask,
      IsolateConfig(
        sendPort: _isolateIncomingPort.sendPort,
        rootIsolateToken: ServicesBinding.rootIsolateToken,
        apiInstanceKey: super.key,
      ),
    );

    _isolateIncomingPort.listen((dynamic message) {
      if (message is SendPort) {
        _isolateSendPort = message;
        if (!_canStartCompleter.isCompleted) {
          _canStartCompleter.complete();
        }
      }

      if (message is ConnectionEventReply) {
        switch (message.callback) {
          case ConnectionCallbacks.onOpen:
            _onOpen?.call(message.key);
            break;
          case ConnectionCallbacks.onDone:
            _onDone?.call(message.key);
            break;
          case ConnectionCallbacks.onError:
            _onError?.call(message.key);
            break;
        }
      }

      if (message is IsolateResponse) {
        if (message.isSubscription) {
          _pendingSubscriptions[message.eventId]?.add(message.response);
        } else {
          print(
              '#### Retrieved response ${(message.response as Response).msgType}');
          final Completer<dynamic>? completer = _pendingEvents[message.eventId];
          if (completer != null) {
            completer.complete(message.response);
            _pendingEvents.remove(message.eventId);
          }
        }
      }

      if (message is CustomIsolateEvent) {
        switch (message.event) {
          case CustomEvent.ping:
          case CustomEvent.activeSymbols:
            final ActiveSymbolsResponse activeSymbolsResponse =
                message.data as ActiveSymbolsResponse;
            _pendingEvents[message.eventId]?.complete(activeSymbolsResponse);

          case CustomEvent.assetIndex:
          case CustomEvent.balance:
          case CustomEvent.buy:
          case CustomEvent.accountList:
          case CustomEvent.accountClosure:
          case CustomEvent.cancel:
          case CustomEvent.cashierPayment:
          case CustomEvent.changeEmail:
          case CustomEvent.changePassword:
          case CustomEvent.confirmEmail:
          case CustomEvent.contractUpdateHistory:
          case CustomEvent.contractUpdate:
          case CustomEvent.contractsFor:
          case CustomEvent.getAccountStatus:
          case CustomEvent.getAccountTypes:
          case CustomEvent.getAvailableAccounts:
          case CustomEvent.getFinancialAssessment:
          case CustomEvent.getLimits:
          case CustomEvent.getSelfExclusion:
          case CustomEvent.getSettings:
          case CustomEvent.identityVerification:
          case CustomEvent.jTokenCreate:
          case CustomEvent.kycAuthStatus:
          case CustomEvent.ticks:
            _pendingSubscriptions[message.eventId]?.add(message.data);
          case CustomEvent.proposalOpenContract:
          case CustomEvent.authorize:
            final AuthorizeReceive authorizeReceive =
                message.data as AuthorizeReceive;
            _pendingEvents[message.eventId]?.complete(authorizeReceive);
          case CustomEvent.landingCompany:
          case CustomEvent.statesList:
          case CustomEvent.residenceList:
        }
      }

      // Check for other messages coming out from Isolate.
    });
  }

  final Map<int, Completer<dynamic>> _pendingEvents =
      <int, Completer<dynamic>>{};

  final Map<int, StreamController<dynamic>> _pendingSubscriptions =
      <int, StreamController<dynamic>>{};

  late final Completer<void> _canStartCompleter;

  final ReceivePort _isolateIncomingPort = ReceivePort();
  SendPort? _isolateSendPort;
  int _eventId = 0;

  int get _getEventId => _eventId++;

  /// A flag to indicate if the connection is proxy aware.
  final bool proxyAwareConnection;

  /// Call manager instance.
  CallManager? _callManager;

  /// Subscription manager instance.
  SubscriptionManager? _subscriptionManager;

  /// Gets API call history.
  CallHistory? get callHistory => _callManager?.callHistory;

  /// Gets API subscription history.
  CallHistory? get subscriptionHistory => _subscriptionManager?.callHistory;

  ConnectionCallback? _onOpen;
  ConnectionCallback? _onDone;
  ConnectionCallback? _onError;

  @override
  Future<void> connect(
    ConnectionInformation? connectionInformation, {
    ConnectionCallback? onOpen,
    ConnectionCallback? onDone,
    ConnectionCallback? onError,
    bool printResponse = false,
  }) async {
    await _canStartCompleter.future;
    print('Sending Connect event to Ioslate ${DateTime.now()}');
    _isolateSendPort?.send(_WSConnectConfig(
      connectionInformation: connectionInformation,
    ));
    _onOpen = onOpen;
    _onDone = onDone;
    _onError = onError;
  }

  Future<T> _callEvent<T>(_IsolateEvent event) {
    final Completer<T> responseCompleter = Completer<T>();
    _pendingEvents[event.eventId] = responseCompleter;

    _isolateSendPort?.send(event);

    return responseCompleter.future;
  }

  @override
  void addToChannel(Map<String, dynamic> request) => _isolateSendPort
      ?.send(_AddToChannelEvent(request: request, eventId: _getEventId));

  @override
  Future<T> call<T>({
    required Request request,
    List<String> nullableKeys = const <String>[],
  }) async {
    final event = _CallEvent<T>(request: request, eventId: _getEventId);
    return _callEvent(event);
  }

  /// Gets the list of active symbols.
  ///
  /// For parameters information refer to [ActiveSymbolsRequest].
  /// Throws an [BaseAPIException] if API response contains an error
  Future<ActiveSymbolsResponse> fetchActiveSymbols(
    ActiveSymbolsRequest request,
  ) async {
    final event = CustomIsolateEvent<ActiveSymbolsResponse>(
      request: request,
      eventId: _getEventId,
      event: CustomEvent.activeSymbols,
    );

    return _callEvent(event);
  }

  Stream<TicksResponse> subscribeTick(TicksRequest request) {
    final event = CustomIsolateEvent<TicksResponse>(
      request: request,
      eventId: _getEventId,
      event: CustomEvent.ticks,
    );

    final StreamController<TicksResponse> responseStream =
        StreamController.broadcast();
    _pendingSubscriptions[event.eventId] = responseStream;

    _isolateSendPort?.send(event);
    return responseStream.stream;
  }

  @override
  Stream<Response>? subscribe({
    required Request request,
    int cacheSize = 0,
    RequestCompareFunction? comparePredicate,
  }) {
    final StreamController<Response> responseStream =
        StreamController.broadcast();
    final subEvent = _SubEvent<Response>(
      request: request,
      eventId: _getEventId,
    );
    _pendingSubscriptions[subEvent.eventId] = responseStream;

    _isolateSendPort?.send(subEvent);
    return responseStream.stream;
  }

  @override
  Future<ForgetReceive> unsubscribe({required String subscriptionId}) {
    final event =
        _UnSubEvent(subscriptionId: subscriptionId, eventId: _getEventId);
    return _callEvent(event);
  }

  @override
  Future<ForgetAllReceive> unsubscribeAll({
    required ForgetStreamType method,
  }) {
    final event = _UnSubAllEvent(streamType: method, eventId: _getEventId);
    return _callEvent(event);
  }

  @override
  Future<void> disconnect() async {
    _isolateSendPort?.send(_DisconnectEvent(eventId: _getEventId));
  }

  Future<AuthorizeReceive> authorize(AuthorizeRequest request) {
    final event = CustomIsolateEvent<AuthorizeReceive>(
      request: request,
      eventId: _getEventId,
      event: CustomEvent.authorize,
    );

    return _callEvent(event);
  }
}
