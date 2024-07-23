import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_deriv_api/api/response/time_response_result.dart';
import 'package:flutter_deriv_api/state/server_time/server_time_cubit.dart';

part 'sync_time_state.dart';

/// Sync time cubit.
class SyncTimeCubit extends Cubit<SyncTimeState> {
  /// Initializes Sync time cubit.
  SyncTimeCubit(ServerTimeCubit serverTimeCubit)
      : super(SyncTimeInitialState()) {
    _currentDateTime = now;

    _stopwatch.start();

    _updateDateTime(serverTimeCubit.state);
    _setPeriodicTimer();

    serverTimeCubit.stream.listen(_updateDateTime);
  }

  final Stopwatch _stopwatch = Stopwatch();
  final Duration _periodicTimerDuration = const Duration(seconds: 1);

  late DateTime _currentDateTime;

  /// Gets current date time.
  DateTime get now => state.dateTime;

  /// Updates date time with server.
  Future<void> _updateDateTime(ServerTimeState serverTimeState) async {
    DateTime? serverTime;

    if (serverTimeState is ServerTimeFetched) {
      serverTime = serverTimeState.serverTime;
    }

    _currentDateTime =
        (serverTime ?? (await TimeResponse.fetchTime()).time)!.toUtc();

    _stopwatch.reset();
  }

  Timer _setPeriodicTimer() => Timer.periodic(
        _periodicTimerDuration,
        (_) {
          emit(
            SyncTimeUpdatedState(
              _currentDateTime = _currentDateTime
                  .add(Duration(milliseconds: _stopwatch.elapsedMilliseconds)),
            ),
          );

          _stopwatch.reset();
        },
      );
}
