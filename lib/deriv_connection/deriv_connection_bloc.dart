import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/helpers.dart';
import 'package:meta/meta.dart';

import 'deriv_connection_websocket.dart';

part 'deriv_connection_event.dart';
part 'deriv_connection_state.dart';

class DerivConnectionBloc
    extends Bloc<DerivConnectionEvent, DerivConnectionState> {
  Timer _serverTimeInterval;

  DerivConnectionBloc() {
    connectWS();
  }

  @override
  DerivConnectionState get initialState => InitialDerivConnectionState();

  void connectWS() {
    BinaryAPI _api = BinaryAPI();

    _api.run(
      onDone: () => this.add(Reconnect()),
      onOpen: () => this.add(Connect(api: _api)),
    );
  }

  @override
  Stream<DerivConnectionState> mapEventToState(
      DerivConnectionEvent event) async* {
    if (event is Connect) {
      try {
        yield Connected(event.api);
        this.add(FetchServerTime());
        _serverTimeInterval = Timer.periodic(Duration(seconds: 90),
            (Timer timer) => this.add(FetchServerTime()));
      } catch (e, stackTrace) {
        print(e);
        print(stackTrace);
        yield ConnectionError(e);
      }
    } else if (event is FetchServerTime) {
      if (state is Connected) {
        final currentState = (state as Connected);
        final resp = await currentState.api.time();

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
        await (state as Connected).api.close();
      }

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }
      yield InitialDerivConnectionState();
    } else if (event is Reconnect) {
      print('Reconnecting ws connection!');

      // api.close should be always invoked before changing the state otherwise the onDone function which is passed to the run funciton will be invoked one more time.
      if (state is Connected) {
        await (state as Connected).api.close();
      }

      yield InitialDerivConnectionState();

      if (_serverTimeInterval != null && _serverTimeInterval.isActive) {
        _serverTimeInterval.cancel();
      }
      await Future.delayed(Duration(seconds: 10));
      connectWS();
    }
  }
}
