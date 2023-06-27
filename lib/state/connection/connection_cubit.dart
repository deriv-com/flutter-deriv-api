import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:deriv_dependency_injector/dependency_injector.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/enums.dart';

part 'connection_state.dart';

/// [ConnectionCubit] is a [Cubit] which manages connection status of websocket.
class ConnectionCubit extends Cubit<ConnectionState> {
  /// Initializes [ConnectionCubit].
  ConnectionCubit(
    ConnectionInformation connectionInformation, {
    BaseAPI? api,
    this.enableDebug = false,
    this.printResponse = false,
  }) : super(const ConnectionInitialState()) {
    APIInitializer()
        .initialize(api: api ?? BinaryAPI(key: _key, enableDebug: enableDebug));

    _api = Injector()<BaseAPI>();

    connect(_connectionInformation = connectionInformation);
  }

  final String _key = '${UniqueKey()}';

  late final BaseAPI _api;

  /// Enables debug mode.
  ///
  /// Default value is `false`.
  final bool enableDebug;

  /// Prints API response to console, only works if [enableDebug] is `true`.
  ///
  /// Default value is `false`.
  final bool printResponse;

  /// Connection status of websocket stream subscription.
  StreamSubscription<APIStatus>? _connectionStatusSubscription;

  static late ConnectionInformation _connectionInformation;

  /// Gets connection information of WebSocket (endpoint, brand, appId).
  static ConnectionInformation get connectionInformation =>
      _connectionInformation;

  /// Gets endpoint of websocket.
  static String get endpoint => _connectionInformation.endpoint;

  /// Gets app id of websocket.
  static String get appId => _connectionInformation.appId;

  /// Connect to Websocket with new [connectionInformation].
  Future<void> connect([ConnectionInformation? connectionInformation]) async {
    try {
      if (connectionInformation != null) {
        _connectionInformation = connectionInformation;
      }

      await _api.disconnect();

      await _api.connect(
        _connectionInformation,
        printResponse: enableDebug && printResponse,
        onError: (String error) => emit(ConnectionErrorState(error)),
      );

      await _handleConnectionStatus(_api);
    } on Exception catch (e) {
      emit(ConnectionErrorState('$e'));
    }
  }

  Future<void> _handleConnectionStatus(BaseAPI api) async {
    await _cancelConnectionStatusSubscription();

    _connectionStatusSubscription = api.connectionStatus.listen(
      (APIStatus status) {
        switch (status) {
          case APIStatus.connecting:
            emit(const ConnectionConnectingState());
            break;
          case APIStatus.connected:
            emit(const ConnectionConnectedState());
            break;
          case APIStatus.disconnected:
            emit(const ConnectionDisconnectedState());
            break;
        }
      },
    );
  }

  Future<void> _cancelConnectionStatusSubscription() async =>
      _connectionStatusSubscription?.cancel();

  @override
  Future<void> close() async {
    await _cancelConnectionStatusSubscription();

    return super.close();
  }
}
