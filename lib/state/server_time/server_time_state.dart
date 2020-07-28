part of 'server_time_bloc.dart';

/// Server time states
abstract class ServerTimeState {}

/// Initial state
class InitialServerTime extends ServerTimeState {
  @override
  String toString() => 'ServerTimeState: InitialServerTime';
}

/// Shows that we are in the process of fetching server time
class FetchingServerTime extends ServerTimeState {
  /// Initializes
  FetchingServerTime();

  @override
  String toString() => 'ServerTimeState: FetchingServerTime';
}

/// Server time fetched state
class ServerTimeFetched extends ServerTimeState {
  /// Initializes
  ServerTimeFetched({
    this.serverTime,
  }) : timeDifference = serverTime == null
            ? null
            : getSecondsSinceEpochDateTime(serverTime) - getCurrentLocalEpoch();

  /// Fetched server time
  final DateTime serverTime;

  /// Difference between [serverTime] and the machine time
  final int timeDifference;

  /// Creates a copy of instance with given parameters
  ServerTimeFetched copyWith({
    DateTime serverTime,
  }) =>
      ServerTimeFetched(serverTime: serverTime ?? this.serverTime);

  @override
  String toString() =>
      'ServerTimeState: ServerTimeFetched(serverTime: $serverTime, timeDifference: $timeDifference)';
}

/// Server time error state
class ServerTimeError extends ServerTimeState {
  /// Initializes with the this [error] message
  ServerTimeError(this.error);

  /// An exception or message from the server
  final String error;

  @override
  String toString() => 'ServerTimeState: ServerTimeError(error: $error)';
}
