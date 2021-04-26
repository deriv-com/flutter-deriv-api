import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/services/connection/connection_service.dart';
import 'package:flutter_deriv_api/services/connection/connection_status.dart';

part 'internet_event.dart';
part 'internet_state.dart';

/// A bloc which listens to internet and WebSocket connectivity changes
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  /// Initializes
  InternetBloc() : super(InternetInitialState()) {
    _connectivityListener = ConnectionService().state.listen(
      (ConnectionStatus connectionState) {
        if (connectionState == ConnectionStatus.connected) {
          if (state is! InternetConnectedState) {
            add(InternetOnlineEvent());
          }
        } else {
          if (state is! InternetDisconnectedState) {
            add(
              InternetOfflineEvent(
                isWebSocketClosed:
                    connectionState != ConnectionStatus.internetDisconnected,
              ),
            );
          }
        }
      },
    );
  }

  StreamSubscription<ConnectionStatus> _connectivityListener;

  @override
  Stream<InternetState> mapEventToState(InternetEvent event) async* {
    dev.log(event.toString());

    if (event is InternetOfflineEvent) {
      yield InternetDisconnectedState(
        isWebSocketClosed: event.isWebSocketClosed,
      );
    } else if (event is InternetOnlineEvent) {
      yield InternetConnectedState();
    }
  }

  @override
  Future<void> close() {
    _connectivityListener?.cancel();

    return super.close();
  }
}
