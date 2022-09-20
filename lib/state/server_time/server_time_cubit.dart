import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/response/time_response_result.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart';

part 'server_time_state.dart';

/// A cubit to fetch and sync machine time with server time.
class ServerTimeCubit extends Cubit<ServerTimeState> {
  /// Initializes [ServerTimeCubit].
  ServerTimeCubit(ConnectionCubit connectionCubit)
      : super(InitialServerTime()) {
    _connectionSubscription =
        connectionCubit.stream.listen(_connectionListener);
  }

  late final StreamSubscription<ConnectionState> _connectionSubscription;

  final Duration _fetchServerTimeDuration = const Duration(seconds: 90);
  final Duration _fetchServerTimeTimeoutDuration = const Duration(seconds: 5);

  Timer? _serverTimeInterval;

  void _connectionListener(ConnectionState state) {
    _fetchServerTime(state);

    _serverTimeInterval = Timer.periodic(
      _fetchServerTimeDuration,
      (Timer timer) => _fetchServerTime(state),
    );
  }

  Future<void> _fetchServerTime(ConnectionState state) async {
    if (state is ConnectionConnectedState) {
      try {
        final TimeResponse serverTime = await TimeResponse.fetchTime()
            .timeout(_fetchServerTimeTimeoutDuration);

        emit(ServerTimeFetched(serverTime: serverTime.time));
      } on Exception catch (e) {
        emit(ServerTimeError('$e'));
      }
    } else {
      _serverTimeInterval?.cancel();
    }
  }

  @override
  Future<void> close() async {
    await _connectionSubscription.cancel();

    return super.close();
  }
}
