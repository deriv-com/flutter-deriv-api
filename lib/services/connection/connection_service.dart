// ignore_for_file: prefer_constructors_over_static_methods

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

/// A class to check the connectivity of the device to the Internet.
class ConnectionService {
  ConnectionService._internal();

  /// Returns [ConnectivityService] instance.
  static ConnectionService get instance =>
      _instance ??= ConnectionService._internal();

  /// Returns the instance of the class.
  static ConnectionService? _instance;

  /// Stream of connection states.
  StreamController<bool> connectionChangeController =
      StreamController<bool>.broadcast();

  /// Stream of bool whether we are connected or not.
  Stream<bool> get state => connectionChangeController.stream;

  /// Initializes connection service.
  Future<void> initialize({
    ConnectionCubit? connectionCubit,
    bool isMock = false,
  }) async {
    if (isMock) {
      return;
    }

    Connectivity().onConnectivityChanged.listen(_checkConnection);
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
