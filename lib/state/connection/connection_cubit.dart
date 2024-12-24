import 'dart:async';
import 'dart:developer' as dev;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_config.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

part 'connection_state.dart';

/// Bringing [ConnectionCubit] to flutter-deriv-api to simplify the usage of api.
class ConnectionCubit extends Cubit<ConnectionState> {
  /// Initializes [ConnectionCubit].
  ConnectionCubit(
    ConnectionInformation connectionInformation, {
    BaseAPI? api,
    this.connectionConfig = const ConnectionConfig(),
  }) : super(const ConnectionInitialState()) {
    _connectionInformation = connectionInformation;

    APIInitializer().initialize(
      api: api ?? BinaryAPI(key: _key, connectionConfig: connectionConfig),
    );

    _api = Injector()<BaseAPI>();

    _connect(_connectionInformation);
  }

  final String _key = '${UniqueKey()}';

  late final BaseAPI _api;

  /// Connection configuration.
  final ConnectionConfig connectionConfig;

  // In some devices like Samsung J6 or Huawei Y7, the call manager doesn't response to the ping call less than 5 sec.
  final Duration _pingTimeout = const Duration(seconds: 5);

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
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// Getter for [BaseAPI] implementation class. By default, it will be [BinaryAPI].
  BaseAPI get api => _api;

  /// Reconnect to Websocket.
  Future<void> reconnect({
    ConnectionInformation? connectionInformation,
    bool isChangingLanguage = false,
  }) async {
    emit(ConnectionDisconnectedState(isChangingLanguage: isChangingLanguage));

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
      await _api.disconnect().timeout(_pingTimeout);
    } on Exception catch (e) {
      dev.log('$runtimeType disconnect exception: $e', error: e);

      unawaited(reconnect());

      return;
    }

    await _api.connect(
      _connectionInformation,
      onOpen: (String key) {
        if (_key == key) {
          emit(const ConnectionConnectedState());
        }
      },
      onDone: (String key) {
        if (_key == key) {
          unawaited(reconnect());
        }
      },
      onError: (String key) {
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
    _connectivitySubscription ??= Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        if (results.any(
            (ConnectivityResult status) => status == ConnectivityResult.none)) {
          emit(const ConnectionDisconnectedState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
    return super.close();
  }
}
