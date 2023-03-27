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
  ConnectionCubit(
    ConnectionInformation connectionInformation, {
    BaseAPI? api,
    this.printResponse = false,
  }) : super(const ConnectionInitialState()) {
    APIInitializer().initialize(api: api ?? BinaryAPI(uniqueKey: _uniqueKey));

    _api = Injector()<BaseAPI>();

    _connectionInformation = connectionInformation;

    if (_api is BinaryAPI) {
      _setupConnectivityListener();
    }

    _startKeepAliveTimer();

    _connect(_connectionInformation);
  }

  /// Prints API response to console.
  final bool printResponse;

  final UniqueKey _uniqueKey = UniqueKey();

  late final BaseAPI? _api;

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

  /// Gets app id of websocket.
  static String get appId => _connectionInformation.appId;

  /// Reconnect to Websocket.
  Future<void> reconnect({ConnectionInformation? connectionInformation}) async {
    emit(const ConnectionDisconnectedState());

    if (connectionInformation != null) {
      _connectionInformation = connectionInformation;
    }

    await _connect(_connectionInformation);
  }

  /// Connects to the web socket.
  Future<void> _connect(ConnectionInformation connectionInformation) async {
    if (state is ConnectionConnectingState) {
      return;
    }

    emit(const ConnectionConnectingState());

    try {
      await _api!.disconnect().timeout(_pingTimeout);
    } on Exception catch (e) {
      dev.log('$runtimeType disconnect exception: $e', error: e);

      unawaited(reconnect());

      return;
    }

    await _api!.connect(
      _connectionInformation,
      printResponse: printResponse,
      onOpen: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey) {
          emit(const ConnectionConnectedState());
        }
      },
      onDone: (UniqueKey uniqueKey) async {
        if (_uniqueKey == uniqueKey) {
          await _api!.disconnect();

          emit(const ConnectionDisconnectedState());
        }
      },
      onError: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey) {
          emit(const ConnectionDisconnectedState());
        }
      },
    );
  }

  void _setupConnectivityListener() =>
      Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult status) async {
          final bool isConnectedToNetwork =
              status == ConnectivityResult.mobile ||
                  status == ConnectivityResult.wifi;

          if (isConnectedToNetwork) {
            final bool isConnected = await _ping();

            if (!isConnected) {
              await reconnect();
            }
          } else if (status == ConnectivityResult.none) {
            emit(const ConnectionDisconnectedState());
          }
        },
      );

  void _startKeepAliveTimer() {
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

    return super.close();
  }
}
