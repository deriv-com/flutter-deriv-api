part of 'connection_bloc.dart';

/// Connection States
abstract class ConnectionState {}

/// Initial state
class InitialConnectionState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: InitialConnectionState';
}

/// shows that we are in the process of connecting
class Connecting extends ConnectionState {
  /// Initializes
  Connecting();

  @override
  String toString() => 'ConnectionState: Connecting...';
}

/// Connected state
class Connected extends ConnectionState {
  @override
  String toString() => 'ConnectionState: Connected';
}

/// Disconnected state
class Disconnected extends ConnectionState {
  @override
  String toString() => 'ConnectionState: Disconnected';
}

/// Reconnecting state
class Reconnecting extends ConnectionState {
  @override
  String toString() => 'ConnectionState: Reconnecting...';
}

/// Connection error state
class ConnectionError extends ConnectionState {
  /// Initializes with the this [error] message
  ConnectionError(this.error);

  /// An exception or message from the server
  final String error;

  @override
  String toString() => 'ConnectionState: Error(error: $error)';
}
