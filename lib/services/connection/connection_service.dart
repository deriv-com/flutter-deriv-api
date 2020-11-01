import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

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
        _hasConnection = await _pingGoogle();

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
        await checkConnectivity();
      });
    }
  }

  void _stopConnectivityTimer() => _connectivityTimer?.cancel();

  Future<bool> _pingGoogle() async {
    try {
      final http.Response response = await http
          .get('https://google.com')
          .timeout(const Duration(seconds: 5));
      if (response.statusCode < 200 || response.statusCode > 299) {
        return Future<bool>.value(false);
      }
    } on Exception catch (_) {
      return Future<bool>.value(false);
    }
    return Future<bool>.value(true);
  }
}
