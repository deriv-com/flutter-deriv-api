import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'connection_service.dart';

part 'internet_event.dart';

part 'internet_state.dart';

/// A bloc which listens to internet and WebSocket connectivity changes
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  /// Initializes
  InternetBloc() {
    _connectivityListener = ConnectionService().state.listen(
      (bool state) {
        if (state) {
          if (this.state is! Connected) {
            add(Online());
          }
        } else {
          if (this.state is! Disconnected) {
            add(Offline());
          }
        }
      },
    );
  }

  StreamSubscription<bool> _connectivityListener;

  @override
  InternetState get initialState => InitialState();

  @override
  Future<void> close() {
    _connectivityListener?.cancel();
    return super.close();
  }

  @override
  Stream<InternetState> mapEventToState(InternetEvent event) async* {
    dev.log(event.toString());
    if (event is Offline) {
      yield Disconnected();
    } else if (event is SocketDisconnected) {
      yield Disconnected(isWebSocketClosed: true);
    } else if (event is Online || event is SocketConnected) {
      yield Connected();
    }
  }
}
