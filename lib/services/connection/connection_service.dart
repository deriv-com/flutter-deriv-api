import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

/// A class to check the connectivity of the device to the Internet.
class ConnectionService {
  /// Initializes
  factory ConnectionService() => _instance;

  ConnectionService._internal();

  static final ConnectionService _instance = ConnectionService._internal();

  /// Stream of connection states.
  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  final Connectivity _connectivity = Connectivity();

  /// Stream of bool whether we are connected or not.
  Stream<bool> get state => connectionChangeController.stream;

  /// Returns true if we are connected to the Internet.
  Future<bool> get isConnectedToInternet async {
    final ConnectivityResult connectivityResult =
        await _connectivity.checkConnectivity();

    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }

  /// Initializes connection service.
  Future<void> initialize({
    ConnectionCubit? connectionCubit,
    bool isMock = false,
  }) async {
    if (isMock) {
      return;
    }

    _connectivity.onConnectivityChanged.listen(_checkConnection);
  }

  Future<void> _checkConnection(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        connectionChangeController.add(true);

        break;
      case ConnectivityResult.none:
        connectionChangeController.add(false);
        break;

      default:
        connectionChangeController.add(false);
    }
  }

  /// Closes the connection service.
  void dispose() => connectionChangeController.close();
}
