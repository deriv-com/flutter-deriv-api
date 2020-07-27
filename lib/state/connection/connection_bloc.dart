import 'dart:async';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

import '../../services/connection/connection_service.dart';
import '../internet/internet_bloc.dart' as internet_bloc;

part 'connection_event.dart';

part 'connection_state.dart';

/// Bringing ConnectionBloc to flutter-deriv-api to simplify the usage of api
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  /// Initializes
  ConnectionBloc(ConnectionInformation connectionInformation) {
    _connectionInformation = connectionInformation;
    _internetBloc = internet_bloc.InternetBloc();
    ModuleContainer().initialize(Injector.getInjector(), uniqueKey: _uniqueKey);
    _api ??= Injector.getInjector().get<BaseAPI>();

    _connectWebSocket();

    _internetListener =
        _internetBloc.listen((internet_bloc.InternetState state) {
      if (state is internet_bloc.Disconnected) {
        add(Disconnect());
      } else if (state is internet_bloc.Connected) {
        _reconnectToWebSocket();
      }
    });
  }

  static const int _reconnectInterval = 5;

  BaseAPI _api;

  StreamSubscription<internet_bloc.InternetState> _internetListener;

  internet_bloc.InternetBloc _internetBloc;

  final UniqueKey _uniqueKey = UniqueKey();

  /// Connection information of WebSocket (endpoint, brand, appId)
  ConnectionInformation get connectionInformation => _connectionInformation;
  ConnectionInformation _connectionInformation;

  @override
  ConnectionState get initialState => InitialConnectionState();

  @override
  Stream<ConnectionState> mapEventToState(ConnectionEvent event) async* {
    if (event is Connect) {
      yield Connected();
    } else if (event is Reconnect || event is Reconfigure) {
      if (event is Reconfigure) {
        _connectionInformation = event.connectionInformation;
      }
      bool shouldReconnect = true;
      // _api.disconnect should be always invoked before changing the state
      // otherwise the onDone function which is passed to the run function will be invoked one more time.
      if (state is Connected) {
        try {
          shouldReconnect = false;
          await _api.disconnect();
        } on Exception catch (e) {
          shouldReconnect = true;
          dev.log(e.toString(), error: e);
        }
      }

      if (event is Reconnect) {
        if (await ConnectionService().checkConnectivity() && shouldReconnect) {
          yield Reconnecting();
        } else {
          yield Disconnected();
        }
      } else {
        // Needed to reset state after changing the endpoint from settings page
        yield InitialConnectionState();
      }

      await Future<void>.delayed(const Duration(seconds: _reconnectInterval));
      _connectWebSocket();
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
    }
  }

  void _connectWebSocket() {
    _api.connect(connectionInformation, onDone: (UniqueKey uniqueKey) {
      if (_uniqueKey == uniqueKey) {
        _reconnectToWebSocket();
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

  void _reconnectToWebSocket() {
    if (state is! Reconnecting && state is! Connected) {
      add(Reconnect());
    }
  }

  @override
  Future<void> close() {
    _internetListener?.cancel();

    return super.close();
  }
}
