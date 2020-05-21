import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/generated/time_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/time_send.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/binary_api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

part 'connection_event.dart';
part 'connection_state.dart';

/// Bringing ConnectionBloc to flutter-deriv-api to simplify the usage of api
class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  /// Initializes
  ConnectionBloc() {
    connectWS();
  }

  Timer _serverTimeInterval;

  @override
  ConnectionState get initialState => InitialConnectionState();

  /// connects the [BinaryAPI] to the web socket
  void connectWS() {
    final BinaryAPI _api = BinaryAPI();

    _api.run(
      onDone: () => add(Reconnect()),
      onOpen: () => add(Connect(api: _api)),
    );
  }

  @override
  Stream<ConnectionState> mapEventToState(ConnectionEvent event) async* {
    if (event is Connect) {
      try {
        yield Connected(event.api);
        add(FetchServerTime());
        _serverTimeInterval = Timer.periodic(const Duration(seconds: 90),
            (Timer timer) => add(FetchServerTime()));
      } on Exception catch (e, stackTrace) {
        print(e);
        print(stackTrace);

        yield ConnectionError(e.toString());
      }
    } else if (event is FetchServerTime) {
      if (state is Connected) {
        final Connected currentState = state;
        final TimeResponse timeResponse =
            await currentState.api.call(request: const TimeRequest());

        if (timeResponse.error != null) {
          print('Fetching server time failed: ${timeResponse.error}');
          throw Exception(timeResponse.error['message']);
        }

        print('Server time is: ${timeResponse.time}');

        yield currentState.copyWith(serverTime: timeResponse.time);
      } else if (state is InitialConnectionState) {
        _serverTimeInterval.cancel();
      }
    } else if (event is Disconnect) {
      if (state is Connected) {
        final Connected currentState = state;
        await currentState.api.close();
      }

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }

      yield InitialConnectionState();
    } else if (event is Reconnect) {
      print('Reconnecting ws connection!');

      // api.close should be always invoked before changing the state otherwise the onDone function which is passed to the run function will be invoked one more time.
      if (state is Connected) {
        final Connected currentState = state;
        await currentState.api.close();
      }

      yield InitialConnectionState();

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }

      await Future<void>.delayed(const Duration(seconds: 10));

      connectWS();
    }
  }
}
