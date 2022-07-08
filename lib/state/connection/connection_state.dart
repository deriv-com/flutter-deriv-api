part of 'connection_cubit.dart';

/// Connection States.
abstract class ConnectionState extends Equatable {
  /// Initializes [ConnectionState].
  const ConnectionState();

  @override
  List<Object> get props => <Object>[];
}

/// Connection initial state.
class ConnectionInitialState extends ConnectionState {
  /// Initializes [ConnectionInitialState].
  const ConnectionInitialState();

  @override
  String toString() => 'ConnectionState: InitialConnectionState';
}

/// Shows that we are in the process of connecting.
class ConnectionConnectingState extends ConnectionState {
  /// Initializes [ConnectionConnectingState].
  const ConnectionConnectingState();

  @override
  String toString() => 'ConnectionState: Connecting...';
}

/// Connection connected state.
class ConnectionConnectedState extends ConnectionState {
  /// Initializes [ConnectionConnectedState].
  const ConnectionConnectedState();

  @override
  String toString() => 'ConnectionState: Connected';
}

/// Connection disconnected state.
class ConnectionDisconnectedState extends ConnectionState {
  /// Initializes [ConnectionDisconnectedState].
  const ConnectionDisconnectedState();

  @override
  String toString() => 'ConnectionState: Disconnected';
}

/// Connection error state.
class ConnectionErrorState extends ConnectionState {
  /// Initializes with the this [error] message.
  const ConnectionErrorState(this.error);

  /// An exception or message from the server.
  final String error;

  @override
  String toString() => 'ConnectionState: Error(error: $error)';

  @override
  List<Object> get props => <Object>[error];
}
