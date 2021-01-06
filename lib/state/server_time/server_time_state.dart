part of 'server_time_bloc.dart';

/// Server time base states.
abstract class ServerTimeState {
  /// Initializes base server time state.
  const ServerTimeState([this.timeDifference = 0]);

  /// Difference between [serverTime] and the machine time (value will be represented as `server time - machine time`).
  ///
  /// Default value is `0`.
  final int timeDifference;
}

/// Initial server time state.
class InitialServerTime extends ServerTimeState {
  @override
  String toString() => 'ServerTimeState: InitialServerTime';
}

/// Shows that we are in the process of fetching server time.
class FetchingServerTime extends ServerTimeState {
  @override
  String toString() => 'ServerTimeState: FetchingServerTime';
}

/// Server time fetched state.
class ServerTimeFetched extends ServerTimeState {
  /// Initializes server time fetched state.
  ServerTimeFetched({this.serverTime, int timeDifference})
      : super(
          timeDifference =
              getSecondsSinceEpochDateTime(serverTime) - getCurrentLocalEpoch(),
        );

  /// Fetched server time.
  final DateTime serverTime;

  /// Creates a copy of instance with given parameters.
  ServerTimeFetched copyWith({DateTime serverTime}) =>
      ServerTimeFetched(serverTime: serverTime ?? this.serverTime);

  @override
  String toString() =>
      'ServerTimeState: ServerTimeFetched(serverTime: $serverTime, timeDifference: $timeDifference)';
}

/// Server time error state.
class ServerTimeError extends ServerTimeState {
  /// Initializes with the this [error] message.
  ServerTimeError(this.error);

  /// An exception or message from the server.
  final String error;

  @override
  String toString() => 'ServerTimeState: ServerTimeError(error: $error)';
}
