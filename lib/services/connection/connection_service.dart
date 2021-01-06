import 'dart:async';

import 'package:flutter_deriv_api/api/common/ping/ping.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_deriv_api/state/connection/connection_bloc.dart';

/// A class to check the connectivity of the device to the Internet
class ConnectionService {
  /// Initializes
  factory ConnectionService() => _instance;

  ConnectionService._internal();

  static final ConnectionService _instance = ConnectionService._internal();
  final int _connectivityCheckInterval = 15;
  final int _pingTimeout = 10;

  bool _hasConnection;

  /// Stream of connection states
  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  /// Stream of bool whether we are connected or not
  Stream<bool> get state => connectionChangeController.stream;

  /// Returns true if we are connected to the Internet.
  bool get isConnectedToInternet => _hasConnection;

  Timer _connectivityTimer;

  ConnectionBloc _connectionBloc;

  Future<bool> _checkConnection(ConnectivityResult result) async {
    final bool previousConnection = _hasConnection;

    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        if (_connectionBloc.state is! Connected) {
          await _connectionBloc.connectWebSocket();
        }

        _hasConnection = await _ping();

        break;
      case ConnectivityResult.none:
        _hasConnection = false;
        break;
      default:
        _hasConnection = false;
    }

    if (previousConnection != _hasConnection) {
      connectionChangeController.add(_hasConnection);
    }

    return _hasConnection;
  }

  /// Closes the connection service
  void dispose() {
    connectionChangeController?.close();
    _stopConnectivityTimer();
  }

  /// Initializes
  Future<void> initialize({
    ConnectionBloc connectionBloc,
    bool isMock = false,
  }) async {
    if (isMock) {
      return;
    }

    _connectionBloc = connectionBloc;
    await _connectivity.checkConnectivity();
    _connectivity.onConnectivityChanged.listen(_checkConnection);

    _startConnectivityTimer();
  }

  /// Checks devices connectivity
  Future<bool> checkConnectivity() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    return _checkConnection(connectivityResult);
  }

  // Checks for change to connectivity to internet every [_connectivityCheckInterval] seconds
  void _startConnectivityTimer() {
    if (_connectivityTimer == null || !_connectivityTimer.isActive) {
      _connectivityTimer = Timer.periodic(
          Duration(seconds: _connectivityCheckInterval), (Timer timer) async {
        await checkConnectivity();
      });
    }
  }

  void _stopConnectivityTimer() => _connectivityTimer?.cancel();

  Future<bool> _ping() async {
    try {
      final Ping response =
          await Ping.ping().timeout(Duration(seconds: _pingTimeout));

      if (response == null || !response.succeeded) {
        return Future<bool>.value(false);
      }
    } on Exception catch (_) {
      return Future<bool>.value(false);
    }

    return Future<bool>.value(true);
  }
}
