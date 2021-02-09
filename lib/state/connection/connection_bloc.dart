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

part 'connection_event.dart';

part 'connection_state.dart';

/// Bringing ConnectionBloc to flutter-deriv-api to simplify the usage of api
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  /// Initializes
  ConnectionBloc(
    ConnectionInformation connectionInformation, {
    this.isMock = false,
  }) : super(InitialConnectionState()) {
    APIInitializer().initialize(isMock: isMock, uniqueKey: _uniqueKey);
    _api ??= Injector.getInjector().get<BaseAPI>();
    _connectionInformation = connectionInformation;

    ConnectionService()
        .initialize(connectionBloc: this, isMock: isMock)
        .then((val) {
      //connectWebSocket();

      _internetBloc = internet_bloc.InternetBloc();

      _internetListener = _internetBloc.listen(
        (internet_bloc.InternetState state) {
          if (state is internet_bloc.Disconnected) {
            add(Disconnect());
          }
        },
      );
    });
  }

  /// Creates mock connection, sets this to [true] for testing purposes
  final bool isMock;

  static const Duration _callTimeOut = Duration(seconds: 10);

  BaseAPI _api;

  StreamSubscription<internet_bloc.InternetState> _internetListener;

  internet_bloc.InternetBloc _internetBloc;

  final UniqueKey _uniqueKey = UniqueKey();

  /// Connection information of WebSocket (endpoint, brand, appId)
  ConnectionInformation get connectionInformation => _connectionInformation;
  ConnectionInformation _connectionInformation;

  @override
  Stream<ConnectionState> mapEventToState(ConnectionEvent event) async* {
    if (event is Connect && state is! Connected) {
      yield Connected();
    } else if (event is Reconnect || event is Reconfigure) {
      if (event is Reconfigure) {
        _connectionInformation = event.connectionInformation;
      }
      bool shouldReconnect = true;
      // _api.disconnect should be always invoked before changing the state
      // otherwise the onDone function which is passed to the run function will be invoked one more time.

      try {
        shouldReconnect = false;
        await _api.disconnect().timeout(_callTimeOut);
      } on Exception catch (e) {
        shouldReconnect = true;
        dev.log(e.toString(), error: e);
      }

      if (state is! Reconnecting) {
        await connectWebSocket();
      }

      if (event is Reconnect && state is! Reconnecting) {
        if (shouldReconnect) {
          yield Reconnecting();
        } else if (state is! Disconnected) {
          yield Disconnected();
        }
      } else {
        // Needed to reset state after changing the endpoint from settings page
        yield InitialConnectionState();
      }
    } else if (event is Disconnect) {
      if (state is Connected) {
        await _api.disconnect();
      }

      if (state is! Disconnected) {
        yield Disconnected();
      } else if (event is DisplayConnectionError) {
        // For any errors related connection, this new event can be used. Currently
        // this is used to handle invalid endpoints and we don't need to show any messages
        yield ConnectionError('');
      }
    } else if (event is ReconnectingEvent) {
      yield Reconnecting();
    }
  }

  /// Connects to the web socket.
  /// This function MUST NOT be called outside of this package.
  Future<void> connectWebSocket() async {
    add(ReconnectingEvent());
    await _api.disconnect().timeout(_callTimeOut);
    await _api.connect(connectionInformation,
        onDone: (UniqueKey uniqueKey) async {
      if (_uniqueKey == uniqueKey) {
        await _api.disconnect();
      }
    }, onOpen: (UniqueKey uniqueKey) {
      if (_uniqueKey == uniqueKey) {
        add(Connect());
      }
    }, onError: (UniqueKey uniqueKey) {
      // ignore reporting errors if there is no connection
      if (_uniqueKey == uniqueKey && state is! Disconnected) {
        add(DisplayConnectionError());
      }
    });
  }

  @override
  Future<void> close() {
    _internetListener?.cancel();

    return super.close();
  }
}
