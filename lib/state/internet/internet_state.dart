part of 'internet_bloc.dart';

/// Internet base state.
abstract class InternetState {}

/// Internet initial state.
class InternetInitialState extends InternetState {
  @override
  String toString() => 'InternetState: InternetInitialState';
}

/// Internet connected state.
class InternetConnectedState extends InternetState {
  @override
  String toString() => 'InternetState: InternetConnectedState';
}

/// Internet disconnected state.
class InternetDisconnectedState extends InternetState {
  /// Initializes disconnected state.
  InternetDisconnectedState({@required this.isWebSocketClosed});

  /// True if webSocket is closed.
  final bool isWebSocketClosed;

  @override
  String toString() => 'InternetState: InternetDisconnectedState';
}
