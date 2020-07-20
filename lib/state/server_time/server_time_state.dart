part of 'server_time_bloc.dart';

/// Server time states
@immutable
abstract class ServerTimeState {}

/// Initial state
class InitialServerTimeState extends ServerTimeState {
  @override
  String toString() => 'InitialServerTimeState';
}

/// Shows that we are in the process of fetching server time
class FetchingServerTime extends ServerTimeState {
  /// Initializes
  FetchingServerTime();

  @override
  String toString() => 'FetchingServerTime';
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
      'ServerTimeFetched(serverTime: $serverTime, timeDifference: $timeDifference)';
}

/// Server time error state
class ServerTimeError extends ServerTimeState {
  /// Initializes with the this [error] message
  ServerTimeError(this.error);

  /// An exception or message from the server
  final String error;

  @override
  String toString() => 'ServerTimeError($error)';
}
