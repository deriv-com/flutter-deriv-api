part of 'connection_cubit.dart';

/// Connection States.
abstract class ConnectionState {}

/// Connection initial state.
class ConnectionInitialState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: InitialConnectionState';
}

/// Shows that we are in the process of connecting.
class ConnectionConnectingState extends ConnectionState {
  /// Initializes connection connecting state
  ConnectionConnectingState();

  @override
  String toString() => 'ConnectionState: Connecting...';
}

/// Connection connected state.
class ConnectionConnectedState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: Connected';
}

/// Connection disconnected state.
class ConnectionDisconnectedState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: Disconnected';
}

/// Connection error state.
class ConnectionErrorState extends ConnectionState {
  /// Initializes with the this [error] message.
  ConnectionErrorState(this.error);

  /// An exception or message from the server.
  final String error;

  @override
  String toString() => 'ConnectionState: Error(error: $error)';
}
