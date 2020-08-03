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
  }

  /// Initializes
  Future<void> initialize() async {
    await _connectivity.checkConnectivity();
    _connectivity.onConnectivityChanged.listen(_checkConnection);
  }

  /// Checks devices connectivity
  Future<bool> checkConnectivity() async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();
    return _checkConnection(connectivityResult);
  }
}
