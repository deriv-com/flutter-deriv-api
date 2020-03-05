import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/helpers.dart';
import 'package:meta/meta.dart';

import '../../connection/connection_websocket.dart';

part 'connection_state.dart';

part 'connection_event.dart';

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
        final Map<String, dynamic> resp = await currentState.api.time();

        if (resp.containsKey('error')) {
          print('Fetching server time failed: ${resp['error']}');
          throw Exception(resp['error']['message']);
        }

        print('Server time is: ${resp['time']}');
        yield currentState.copyWith(serverTime: resp['time']);
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

      // api.close should be always invoked before changing the state otherwise the onDone function which is passed to the run funciton will be invoked one more time.
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
