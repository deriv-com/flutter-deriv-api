part of 'connection_cubit.dart';

/// Connection states base class.
@Deprecated('Use DerivConnectionState instead')
abstract class ConnectionState extends Equatable {
  /// Initializes [ConnectionState].
  const ConnectionState();

  @override
  String toString() => 'ConnectionState: $runtimeType';

  @override
  List<Object> get props => <Object>[];
}

/// Connection states base class.
abstract class DerivConnectionState extends ConnectionState {
  /// Initializes [DerivConnectionState].
  const DerivConnectionState();

  @override
  String toString() => 'DerivConnectionState: $runtimeType';

  @override
  List<Object> get props => <Object>[];
}

/// Connection initial state.
class ConnectionInitialState extends DerivConnectionState {
  /// Initializes [ConnectionInitialState].
  const ConnectionInitialState();
}

/// Shows that we are in the process of connecting.
class ConnectionConnectingState extends DerivConnectionState {
  /// Initializes [ConnectionConnectingState].
  const ConnectionConnectingState();
}

/// Connection connected state.
class ConnectionConnectedState extends DerivConnectionState {
  /// Initializes [ConnectionConnectedState].
  const ConnectionConnectedState();
}

/// Connection disconnected state.
class ConnectionDisconnectedState extends DerivConnectionState {
  /// Initializes [ConnectionDisconnectedState].
  const ConnectionDisconnectedState({this.isChangingLanguage = false});

  /// Is the App language changing during connection change
  final bool isChangingLanguage;
}

/// Connection error state.
class ConnectionErrorState extends DerivConnectionState {
  /// Initializes with the this [error] message.
  const ConnectionErrorState(this.error);

  /// An exception or message from the server.
  final String error;

  @override
  String toString() => 'ConnectionState: Error(error: $error)';

  @override
  List<Object> get props => <Object>[error];
}
