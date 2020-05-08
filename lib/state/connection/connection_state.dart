part of 'connection_bloc.dart';

/// Connection States
@immutable
abstract class ConnectionState {}

/// Initial state
class InitialConnectionState extends ConnectionState {
  @override
  String toString() => 'InitialConnectionState';
}

/// shows that we are in the process of connecting
class Connecting extends ConnectionState {
  /// Initializes
  Connecting(this.api);

  /// a reference of base api
  final BaseAPI api;

  @override
  String toString() => 'ConnectionState(Connecting)';
}

/// connected state
class Connected extends ConnectionState {
  /// Initializes
  Connected(this.api, {this.serverTime})
      : timeDifference =
            serverTime != null ? serverTime - getCurrentLocalEpoch() : null;

  /// a reference of BinaryAPI is currently connected
  final BaseAPI api;

  /// fetched server time
  final int serverTime;

  /// difference between [serverTime] and the time of the device
  final int timeDifference;

  /// Creates a copy of instance with given parameters
  Connected copyWith({
    BaseAPI api,
    int serverTime,
  }) =>
      Connected(
        api ?? this.api,
        serverTime: serverTime ?? this.serverTime,
      );

  @override
  String toString() =>
      'ConnectionState(Connected, serverTime: $serverTime, timeDifference: $timeDifference)';
}

/// Connection error state
class ConnectionError extends ConnectionState {
  /// Initializes with the this [error] message
  ConnectionError(this.error);

  /// An exception or message from the server
  final String error;

  @override
  String toString() => 'ConnectionState(Error)';
}
