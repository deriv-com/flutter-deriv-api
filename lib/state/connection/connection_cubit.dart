import 'dart:async';
import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:deriv_web_socket_client/deriv_web_socket_client.dart' as ws;

import 'package:flutter_deriv_api/api/api_initializer.dart';
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
    this.enableDebug = false,
    this.printResponse = false,
  }) : super(const ConnectionInitialState()) {
    APIInitializer().initialize(
      api: api ?? BinaryAPI(key: _key, enableDebug: enableDebug),
    );

    _api = Injector()<BaseAPI>();

    _connectionInformation = connectionInformation;

    _connect(_connectionInformation);
  }

  final String _key = '${UniqueKey()}';

  late final BaseAPI? _api;

  /// Enables debug mode.
  ///
  /// Default value is `false`.
  final bool enableDebug;

  /// Prints API response to console, only works if [enableDebug] is `true`.
  ///
  /// Default value is `false`.
  final bool printResponse;

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
      await _api!.disconnect();
    } on Exception catch (e) {
      dev.log('$runtimeType disconnect exception: $e', error: e);

      unawaited(reconnect());

      return;
    }

    await _api!.connect(
      _connectionInformation,
      printResponse: enableDebug && printResponse,
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

    _setupConnectivityListener();
  }

  void _setupConnectivityListener() =>
      _api?.connectionStatus.listen((ws.ConnectionState state) {
        switch (state) {
          case ws.ConnectedState():
          case ws.ReconnectedState():
            emit(const ConnectionConnectedState());
            break;
          case ws.DisconnectedState():
          case ws.DisconnectingState():
            emit(const ConnectionDisconnectedState());
            break;
          case ws.ConnectingState():
          case ws.ReconnectingState():
            emit(const ConnectionConnectingState());
            break;
        }
      });
}
