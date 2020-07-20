import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

part 'connection_event.dart';

part 'connection_state.dart';

/// Bringing ConnectionBloc to flutter-deriv-api to simplify the usage of api
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  /// Initializes
  ConnectionBloc(this.connectionInformation) {
    ModuleContainer().initialize(Injector.getInjector());

    _connectWebSocket();
  }

  BaseAPI _api;

  /// Connection information of WebSocket (endpoint, brand, appId)
  final ConnectionInformation connectionInformation;

  @override
  ConnectionState get initialState => InitialConnectionState();

  @override
  Stream<ConnectionState> mapEventToState(ConnectionEvent event) async* {
    if (event is Connect) {
      yield Connected();
    } else if (event is Disconnect) {
      if (state is Connected) {
        await _api.disconnect();
      }
      yield InitialConnectionState();
    } else if (event is Reconnect) {
      print('Reconnecting ws connection!');

      // api.close should be always invoked before changing the state otherwise the onDone function which is passed to the run function will be invoked one more time.
      if (state is Connected) {
        await _api.disconnect();
      }

      yield InitialConnectionState();

      await Future<void>.delayed(const Duration(seconds: 10));

      _connectWebSocket();
    }
  }

  void _connectWebSocket() {
    _api ??= Injector.getInjector().get<BaseAPI>();

    _api.connect(
      connectionInformation,
      onDone: () => add(Reconnect()),
      onOpen: () => add(Connect()),
    );
  }
}
