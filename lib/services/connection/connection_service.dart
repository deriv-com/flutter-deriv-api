import 'dart:async';

import 'package:connectivity/connectivity.dart';

import 'package:flutter_deriv_api/api/common/ping/ping.dart';
import 'package:flutter_deriv_api/services/connection/connection_status.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';

/// A class to check the connectivity of the device to the Internet
class ConnectionService {
  /// Initializes
  factory ConnectionService() => _instance;

  ConnectionService._internal();

  static final ConnectionService _instance = ConnectionService._internal();
  final int _connectivityCheckInterval = 5;
  final int _pingTimeout = 5;
  // In some devices like Samsung J6 or Huawei Y7, the call manager doesn't response to the ping call less than 8 sec.
  final int _initialPingTimeOut = 8;
  final int _pingMaxExceptionCount = 3;
  int _pingExceptionCount = 0;

  ConnectionStatus _connectionStatus = ConnectionStatus.connecting;

  /// Stream of connection states
  StreamController<ConnectionStatus> connectionChangeController =
      StreamController<ConnectionStatus>.broadcast();

  final Connectivity _connectivity = Connectivity();

  /// Stream of bool whether we are connected or not
  Stream<ConnectionStatus> get state => connectionChangeController.stream;

  /// Initializes
  Future<void> initialize({
    ConnectionBloc connectionBloc,
    bool isMock = false,
  }) async {
    if (isMock) {
      return;
    }

    _connectionBloc = connectionBloc;

    await checkConnectivity();

    _connectivity.onConnectivityChanged.listen(_checkConnection);

    _startConnectivityTimer();
  }

  /// Returns true if we are connected to the Internet.
  bool get isConnectedToInternet =>
      _connectionStatus == ConnectionStatus.connected;

  Timer _connectivityTimer;

  ConnectionBloc _connectionBloc;

  Future<ConnectionStatus> _checkConnection(
    ConnectivityResult connectivityResult,
  ) async {
    final ConnectionStatus previousConnection = _connectionStatus;

    if (_connectionBloc.state is ConnectionReconnectingState) {
      return ConnectionStatus.connecting;
    }

    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        final bool pingResult = await _checkPingConnection();

        _connectionStatus = pingResult
            ? ConnectionStatus.connected
            : ConnectionStatus.websocketDisconnected;

        if (_connectionBloc.state is! ConnectionConnectedState) {
          await _connectionBloc.connectWebSocket(
            isWebSocketClosed:
                _connectionStatus == ConnectionStatus.websocketDisconnected,
          );
        }

        break;
      case ConnectivityResult.none:
        _connectionStatus = ConnectionStatus.internetDisconnected;
        break;

      default:
        _connectionStatus = ConnectionStatus.internetDisconnected;
    }

    if (previousConnection != _connectionStatus) {
      connectionChangeController.add(_connectionStatus);
    }

    return _connectionStatus;
  }

  /// Closes the connection service
  void dispose() {
    connectionChangeController?.close();
    _stopConnectivityTimer();
  }

  /// Checks devices connectivity
  Future<bool> checkConnectivity() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    final ConnectionStatus connectionResult =
        await _checkConnection(connectivityResult);

    return connectionResult == ConnectionStatus.connected;
  }

  // Checks for change to connectivity to internet every [_connectivityCheckInterval] seconds
  void _startConnectivityTimer() {
    if (_connectivityTimer == null || !_connectivityTimer.isActive) {
      _connectivityTimer = Timer.periodic(
        Duration(seconds: _connectivityCheckInterval),
        (Timer timer) async => checkConnectivity(),
      );
    }
  }

  void _stopConnectivityTimer() => _connectivityTimer?.cancel();

  Future<bool> _ping() async {
    try {
      final Ping response = await Ping.ping().timeout(
        Duration(
          seconds: _connectionBloc.state is ConnectionInitialState
              ? _initialPingTimeOut
              : _pingTimeout,
        ),
      );

      if (response == null || !response.succeeded) {
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
      _pingExceptionCount++;

      if (_pingExceptionCount >= _pingMaxExceptionCount) {
        return false;
      }

      return _connectionStatus == ConnectionStatus.connected;
    }

    _pingExceptionCount = 0;

    return true;
  }
}
