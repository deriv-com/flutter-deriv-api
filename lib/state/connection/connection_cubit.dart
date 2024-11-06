import 'dart:async';
import 'dart:developer' as dev;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/ping_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

part 'connection_state.dart';

/// Bringing [ConnectionCubit] to flutter-deriv-api to simplify the usage of api.
class ConnectionCubit extends Cubit<ConnectionState> {
  /// Initializes [ConnectionCubit].
  ConnectionCubit(ConnectionInformation connectionInformation, {
    BaseAPI? api,
    this.enableDebug = false,
    // TODO(NA): Refactor to only get BinaryAPI instance. and printResponse and proxyAwareConnection can be part of BinaryAPI only.
    this.printResponse = false,
    this.proxyAwareConnection = false,
  }) : super(const ConnectionInitialState()) {
    _connectionInformation = connectionInformation;

    APIInitializer().initialize(
      api: api ??
          BinaryAPI(
            key: _key,
            proxyAwareConnection: proxyAwareConnection,
            enableDebug: enableDebug,
          ),
    );

    _api = Injector()<BaseAPI>();

    _connect(_connectionInformation);

    _startKeepAliveTimer();
  }

  final String _key = '${UniqueKey()}';

  late final BaseAPI _api;

  /// Enables debug mode.
  ///
  /// Default value is `false`.
  final bool enableDebug;

  /// Prints API response to console, only works if [enableDebug] is `true`.
  ///
  /// Default value is `false`.
  final bool printResponse;

  /// A flag to indicate if the connection is proxy aware.
  final bool proxyAwareConnection;

  // In some devices like Samsung J6 or Huawei Y7, the call manager doesn't response to the ping call less than 5 sec.
  final Duration _pingTimeout = const Duration(seconds: 5);

  final Duration _connectivityCheckInterval = const Duration(seconds: 5);

  Timer? _connectivityTimer;

  static late ConnectionInformation _connectionInformation;

  /// Gets connection information of WebSocket (endpoint, brand, appId).
  static ConnectionInformation get connectionInformation =>
      _connectionInformation;

  /// Gets endpoint of websocket.
  static String get endpoint => _connectionInformation.endpoint;

  /// Gets auth endpoint of websocket.
  static String get authEndpoint => _connectionInformation.authEndpoint;

  /// Gets app id of websocket.
  static String get appId => _connectionInformation.appId;

  /// Stream subscription for connectivity.
  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;

  /// Getter for [BaseAPI] implementation class. By default, it will be [BinaryAPI].
  BaseAPI get api => _api;

  /// Reconnect to Websocket.
  Future<void> reconnect({
    required int source,
    ConnectionInformation? connectionInformation,
    bool isChangingLanguage = false,
  }) async {
    emit(ConnectionDisconnectedState(isChangingLanguage: isChangingLanguage));

    if (connectionInformation != null) {
      _connectionInformation = connectionInformation;
    }
    print('@@@@@ Reconnect from source $source ${DateTime.now()}');

    await _connect(_connectionInformation);
  }

  /// Connects to the web socket.
  Future<void> _connect(ConnectionInformation connectionInformation) async {
    if (state is ConnectionConnectingState) {
      return;
    }

    emit(const ConnectionConnectingState());

    try {
      await _api.disconnect().timeout(_pingTimeout);
    } on Exception catch (e) {
      dev.log('$runtimeType disconnect exception: $e', error: e);

      unawaited(reconnect(source: 5));

      return;
    }

    final Stopwatch stopwatch = Stopwatch()
      ..start();
    print('@@@@@ Connecting to websocket ${DateTime.now()}');
    await _api.connect(
      _connectionInformation,
      printResponse: enableDebug && printResponse,
      onOpen: (String key) {
        print('@@@@@ Connected ${DateTime.now()}');
        if (_key == key) {
          if (stopwatch.isRunning) {
            stopwatch.stop();
            // print(
            //     '@@@@@ Reconnecting took ${stopwatch.elapsedMilliseconds} ms');
          }
          emit(const ConnectionConnectedState());
        }
      },
      onDone: (String key) {
        print('@@@@@ ON Done ${DateTime.now()}');
        if (_key == key) {
          unawaited(reconnect(source: 6));
        }
      },
      onError: (String key) {
        print('@@@@@ ON Error${DateTime.now()}');
        if (_key == key) {
          emit(const ConnectionDisconnectedState());
        }
      },
    );

    if (_api is BinaryAPI) {
      _setupConnectivityListener();
    }
  }

  void _setupConnectivityListener() {
    connectivitySubscription ??= Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> statuses) async {
        print('@@@@@ Connectivity changed $statuses ${DateTime.now()}');
        final bool isConnectedToNetwork = statuses.any((status) =>
        status == ConnectivityResult.mobile ||
            status == ConnectivityResult.wifi ||
            status == ConnectivityResult.vpn);

        if (isConnectedToNetwork) {
          // final bool isConnected = await _ping();

          // if (!isConnected) {
          await reconnect(source: 7);
          // }
        } else {
          emit(const ConnectionDisconnectedState());
        }
      },
    );
  }

  void _startKeepAliveTimer() {
    _ping();
    if (_connectivityTimer == null || !_connectivityTimer!.isActive) {
      _connectivityTimer =
          Timer.periodic(_connectivityCheckInterval, (Timer timer) => _ping());
    }
  }

  Future<bool> _ping() async {
    try {
      final PingResponse response =
      await PingResponse.pingMethod().timeout(_pingTimeout);
      return response.ping == PingEnum.pong;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _connectivityTimer?.cancel();
    connectivitySubscription?.cancel();
    connectivitySubscription = null;
    return super.close();
  }
}
