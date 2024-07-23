part of 'connection_cubit.dart';

/// Connection states base class.
abstract class ConnectionState extends Equatable {
  /// Initializes [ConnectionState].
  const ConnectionState();

  @override
  String toString() => 'ConnectionState: $runtimeType';

  @override
  List<Object> get props => <Object>[];
}

/// Connection initial state.
class ConnectionInitialState extends ConnectionState {
  /// Initializes [ConnectionInitialState].
  const ConnectionInitialState();
}

/// Shows that we are in the process of connecting.
class ConnectionConnectingState extends ConnectionState {
  /// Initializes [ConnectionConnectingState].
  const ConnectionConnectingState();
}

/// Connection connected state.
class ConnectionConnectedState extends ConnectionState {
  /// Initializes [ConnectionConnectedState].
  const ConnectionConnectedState();
}

/// Connection disconnected state.
class ConnectionDisconnectedState extends ConnectionState {
  /// Initializes [ConnectionDisconnectedState].
  const ConnectionDisconnectedState({this.isChangingLanguage = false});

  /// Is the App language changing during connection change
  final bool isChangingLanguage;
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
