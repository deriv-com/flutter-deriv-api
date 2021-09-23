import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/connection/connection_service.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/state/internet/internet_bloc.dart'
    as internet_bloc;

part 'connection_state.dart';

/// Bringing [ConnectionCubit] to flutter-deriv-api to simplify the usage of api
class ConnectionCubit extends Cubit<ConnectionState> {
  /// Initializes
  ConnectionCubit(
    ConnectionInformation connectionInformation, {
    this.isMock = false,
  }) : super(InitialConnectionState()) {
    APIInitializer().initialize(isMock: isMock, uniqueKey: _uniqueKey);
    _api ??= Injector.getInjector().get<BaseAPI>();
    _connectionInformation = connectionInformation;

    ConnectionService().initialize(connectionCubit: this, isMock: isMock);

    _internetBloc = internet_bloc.InternetBloc();

    _internetListener = _internetBloc.stream.listen(
      (internet_bloc.InternetState internetState) {
        if (internetState is internet_bloc.Disconnected) {
          disconnect();
        }
      },
    );
  }

  /// Creates mock connection, sets this to [true] for testing purposes
  final bool isMock;

  BaseAPI? _api;

  StreamSubscription<internet_bloc.InternetState>? _internetListener;

  late internet_bloc.InternetBloc _internetBloc;

  final UniqueKey _uniqueKey = UniqueKey();

  /// Connection information of WebSocket (endpoint, brand, appId)
  ConnectionInformation? get connectionInformation => _connectionInformation;
  ConnectionInformation? _connectionInformation;

  /// Connects to the web socket. This function MUST NOT be called outside of this package.
  Future<void> connect() async {
    if (state is Connected) {
      return;
    }

    emit(Connecting());

    await _api?.connect(
      connectionInformation,
      onDone: (UniqueKey uniqueKey) async {
        if (_uniqueKey == uniqueKey) {
          await _api?.disconnect();

          emit(Disconnected());
        }
      },
      onOpen: (UniqueKey uniqueKey) {
        if (_uniqueKey == uniqueKey) {
          emit(Connected());
        }
      },
      onError: (UniqueKey uniqueKey) {
        // ignore reporting errors if there is no connection
        if (_uniqueKey == uniqueKey && state is! Disconnected) {
          emit(ConnectionError(''));
        }
      },
    );
  }

  /// Reconnects to the web socket.
  Future<void> reconnect({
    ConnectionInformation? connectionInformation,
  }) async {
    if (state is Reconnecting) {
      return;
    }

    emit(Reconnecting());

    if (connectionInformation != null) {
      _connectionInformation = connectionInformation;
    }

    try {
      await _api?.disconnect();

      emit(Disconnected());

      await _api?.connect(connectionInformation);

      emit(Connected());
    } on Exception catch (e) {
      dev.log(e.toString(), error: e);

      emit(ConnectionError(e.toString()));
    }
  }

  /// Disconnects from the web socket.
  Future<void> disconnect() async {
    await _api?.disconnect();

    emit(Disconnected());
  }

  @override
  Future<void> close() {
    _internetListener?.cancel();
    _internetListener = null;

    return super.close();
  }
}
