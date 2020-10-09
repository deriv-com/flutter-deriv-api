import 'dart:async';

import 'package:connectivity/connectivity.dart';

/// A class to check the connectivity of the device to the Internet
class ConnectionService {
  /// Initializes
  factory ConnectionService() => _instance;

  ConnectionService._internal();

  static final ConnectionService _instance = ConnectionService._internal();

  bool _hasConnection = true;

  /// Stream of connection states
  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  /// Stream of bool whether we are connected or not
  Stream<bool> get state => connectionChangeController.stream;

  /// Returns true if we are connected to the Internet.
  bool get isConnectedToInternet => _hasConnection;

  Timer _connectivityTimer;

  Future<bool> _checkConnection(ConnectivityResult result) async {
    final bool previousConnection = _hasConnection;

    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        _hasConnection = true;
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
    bool isMock = false,
  }) async {
    if (isMock) {
      return;
    }

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

  // Checks for change to connectivity to internet every 15 seconds
  void _startConnectivityTimer() {
    if (_connectivityTimer == null || !_connectivityTimer.isActive) {
      _connectivityTimer =
          Timer.periodic(const Duration(seconds: 15), (Timer timer) async {
        checkConnectivity();
      });
    }
  }

  void _stopConnectivityTimer() => _connectivityTimer?.cancel();
}
