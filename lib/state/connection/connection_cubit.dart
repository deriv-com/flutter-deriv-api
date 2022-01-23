import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/ping_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/connection_service.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

part 'connection_state.dart';

/// Bringing [ConnectionCubit] to flutter-deriv-api to simplify the usage of api.
class ConnectionCubit extends Cubit<ConnectionState> {
  /// Initializes [ConnectionCubit].
  ConnectionCubit(
    ConnectionInformation connectionInformation, {
    this.isMock = false,
  }) : super(ConnectionInitialState()) {
    APIInitializer().initialize(isMock: isMock, uniqueKey: _uniqueKey);

    _api ??= Injector.getInjector().get<BaseAPI>();

    _connectionInformation = connectionInformation;

    ConnectionService().state.listen(
      (bool state) {
        if (state) {
          connect();
        } else {
          if (state is! ConnectionDisconnectedState) {
            emit(ConnectionDisconnectedState());
          }
        }
      },
    );

    _startConnectivityTimer();

    connect();
  }

  /// Creates mock connection, sets this to [true] for testing purposes
  final bool isMock;

  static const Duration _callTimeOut = Duration(seconds: 10);

  // In some devices like Samsung J6 or Huawei Y7, the call manager doesn't response to the ping call less than 8 sec.
  final int _pingTimeout = 5;
  final int _pingMaxExceptionCount = 3;
  final int _connectivityCheckInterval = 5;

  final UniqueKey _uniqueKey = UniqueKey();

  int _pingExceptionCount = 0;

  BaseAPI? _api;
  Timer? _connectivityTimer;

  static late ConnectionInformation _connectionInformation;

  /// Gets connection information of WebSocket (endpoint, brand, appId).
  static ConnectionInformation get connectionInformation =>
      _connectionInformation;

  /// Gets endpoint of websocket.
  static String get endpoint => _connectionInformation.endpoint;

  /// Gets app id of websocket.
  static String get appId => _connectionInformation.appId;

  /// Connects to the web socket.
  ///
  /// This function MUST NOT be called outside of this package.
  Future<void> connect({ConnectionInformation? connectionInformation}) async {
    if (state is! ConnectionConnectingState) {
      emit(ConnectionConnectingState());
    }

    if (connectionInformation != null) {
      _connectionInformation = connectionInformation;
    }

    await _api!.disconnect().timeout(_callTimeOut);

    await _api!.connect(
      _connectionInformation,
      onDone: (UniqueKey uniqueKey) async {
        if (_uniqueKey == uniqueKey) {
          await _api!.disconnect();

          emit(ConnectionDisconnectedState());
        }
      },
      onOpen: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey && state is! ConnectionConnectedState) {
          emit(ConnectionConnectedState());
        }
      },
      onError: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey) {
          emit(ConnectionDisconnectedState());
        }
      },
    );
  }

  // Checks for change to connectivity to internet every [_connectivityCheckInterval] seconds.
  void _startConnectivityTimer() {
    if (_connectivityTimer == null || !_connectivityTimer!.isActive) {
      _connectivityTimer = Timer.periodic(
        Duration(seconds: _connectivityCheckInterval),
        (Timer timer) async {
          final bool isOnline = await _checkPingConnection();

          if (!isOnline) {
            emit(ConnectionDisconnectedState());
          }
        },
      );
    }
  }

  void _stopConnectivityTimer() => _connectivityTimer?.cancel();

  Future<bool> _ping() async {
    try {
      final PingResponse response = await PingResponse.pingMethod()
          .timeout(Duration(seconds: _pingTimeout));

      if (response.ping == null) {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  Future<bool> _checkPingConnection() async {
    final bool _pingSuccess = await _ping();

    if (!_pingSuccess) {
      if (_pingExceptionCount++ > _pingMaxExceptionCount) {
        _pingExceptionCount = 0;

        return false;
      }

      return true;
    }

    _pingExceptionCount = 0;

    return true;
  }

  @override
  Future<void> close() {
    _stopConnectivityTimer();

    return super.close();
  }
}
