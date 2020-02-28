part of 'connection_bloc.dart';

///
@immutable
abstract class ConnectionState {}

/// Initial state
class InitialConnectionState extends ConnectionState {
  @override
  String toString() => 'InitialConnectionState';
}

/// shows that we are in the process of connecting
class Connecting extends ConnectionState {
  ///
  Connecting(this.api);

  ///
  final BinaryAPI api;

  @override
  String toString() => 'ConnectionState(Connecting)';
}

/// connected state
class Connected extends ConnectionState {
  ///
  Connected(this.api, {this.serverTime})
      : timeDifference =
            serverTime != null ? serverTime - getCurrentLocalEpoch() : null;

  /// a reference of BinaryAPI is currently connected
  final BinaryAPI api;
  /// fetched server time
  final int serverTime;
  /// difference between [serverTime] and the time of the device
  final int timeDifference;

  ///
  Connected copyWith({BinaryAPI api, int serverTime}) =>
      Connected(api ?? this.api, serverTime: serverTime ?? this.serverTime);

  @override
  String toString() =>
      'ConnectionState(Connected, serverTime: $serverTime, timeDifference: $timeDifference)';
}

///
class ConnectionError extends ConnectionState {
  ///
  ConnectionError(this.error);

  /// An exception or message from the server
  final String error;


  @override
  String toString() => 'ConnectionState(Error)';
}
