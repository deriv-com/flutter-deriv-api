import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/generated/time_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/time_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

part 'connection_event.dart';
part 'connection_state.dart';

/// Bringing ConnectionBloc to flutter-deriv-api to simplify the usage of api
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  /// Initializes
  ConnectionBloc() {
    ModuleContainer().initialize(Injector.getInjector());

    connectWebsocket();
  }

  BaseAPI _api;
  Timer _serverTimeInterval;

  @override
  ConnectionState get initialState => InitialConnectionState();

  @override
  Stream<ConnectionState> mapEventToState(ConnectionEvent event) async* {
    if (event is Connect) {
      try {
        yield Connected();

        add(FetchServerTime());

        _serverTimeInterval = Timer.periodic(const Duration(seconds: 90),
            (Timer timer) => add(FetchServerTime()));
      } on Exception catch (e) {
        print(e);

        yield ConnectionError(e.toString());
      }
    } else if (event is FetchServerTime) {
      if (state is Connected) {
        final Connected currentState = state;
        final TimeResponse timeResponse =
            await _api.call(request: const TimeRequest());

        if (timeResponse.error != null) {
          print('Fetching server time failed: ${timeResponse.error}');
          throw Exception(timeResponse.error['message']);
        }

        print('Server time is: ${timeResponse.time}');

        yield currentState.copyWith(serverTime: getDateTime(timeResponse.time));
      } else if (state is InitialConnectionState) {
        _serverTimeInterval.cancel();
      }
    } else if (event is Disconnect) {
      if (state is Connected) {
        await _api.disconnect();
      }

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }

      yield InitialConnectionState();
    } else if (event is Reconnect) {
      print('Reconnecting ws connection!');

      // api.close should be always invoked before changing the state otherwise the onDone function which is passed to the run function will be invoked one more time.
      if (state is Connected) {
        await _api.disconnect();
      }

      yield InitialConnectionState();

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }

      await Future<void>.delayed(const Duration(seconds: 10));

      connectWebsocket();
    }
  }

  /// connects the [BinaryAPI] to the web socket
  void connectWebsocket() {
    _api ??= Injector.getInjector().get<BaseAPI>();

    _api.connect(
      ConnectionInformation(
        onDone: () => add(Reconnect()),
        onOpen: () => add(Connect()),
      ),
    );
  }
}
