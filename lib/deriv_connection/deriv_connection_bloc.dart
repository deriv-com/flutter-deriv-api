import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/helpers.dart';
import 'package:meta/meta.dart';

import 'deriv_connection_websocket.dart';

part 'deriv_connection_event.dart';

part 'deriv_connection_state.dart';

/// Bringing ConnectionBloc to flutter-deriv-api to simplify the usage of api
class DerivConnectionBloc
    extends Bloc<DerivConnectionEvent, DerivConnectionState> {
  ///
  DerivConnectionBloc() {
    connectWS();
  }

  Timer _serverTimeInterval;

  @override
  DerivConnectionState get initialState => InitialDerivConnectionState();

  /// connects the [BinaryAPI] to the web socket
  void connectWS() {
    final BinaryAPI _api = BinaryAPI();

    _api.run(
      onDone: () => add(Reconnect()),
      onOpen: () => add(Connect(api: _api)),
    );
  }

  @override
  Stream<DerivConnectionState> mapEventToState(
      DerivConnectionEvent event) async* {
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
      } else if (state is InitialDerivConnectionState) {
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
      yield InitialDerivConnectionState();
    } else if (event is Reconnect) {
      print('Reconnecting ws connection!');

      // api.close should be always invoked before changing the state otherwise the onDone function which is passed to the run funciton will be invoked one more time.
      if (state is Connected) {
        final Connected currentState = state;
        await currentState.api.close();
      }

      yield InitialDerivConnectionState();

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }
      await Future<void>.delayed(const Duration(seconds: 10));
      connectWS();
    }
  }
}
