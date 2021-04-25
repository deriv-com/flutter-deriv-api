part of 'connection_bloc.dart';

/// Connection base state.
abstract class ConnectionState {}

/// Connection initial state.
class ConnectionInitialState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: ConnectionInitialState';
}

/// Connection connecting state, shows that we are in the process of connecting.
class ConnectionConnectingState extends ConnectionState {
  /// Initializes connection connecting state.
  ConnectionConnectingState();

  @override
  String toString() => 'ConnectionState: ConnectionConnectingState';
}

/// Connection connected state.
class ConnectionConnectedState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: ConnectionConnectedState';
}

/// Connection Disconnected state.
class ConnectionDisconnectedState extends ConnectionState {
  /// Initializes disconnected state.
  ConnectionDisconnectedState({this.isWebSocketClosed = false});

  /// True if webSocket is closed.
  final bool isWebSocketClosed;

  @override
  String toString() => 'ConnectionState: ConnectionDisconnectedState';
}

/// Connection reconnecting state.
class ConnectionReconnectingState extends ConnectionState {
  @override
  String toString() => 'ConnectionState: ConnectionReconnectingState';
}

/// Connection error state.
class ConnectionErrorState extends ConnectionState {
  /// Initializes with the this [error] message.
  ConnectionErrorState(this.error);

  /// An exception or message from the server.
  final String error;

  @override
  String toString() => 'ConnectionState: ConnectionErrorState(error: $error)';
}
