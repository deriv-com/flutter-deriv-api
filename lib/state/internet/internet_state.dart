part of 'internet_bloc.dart';

/// Internet state
abstract class InternetState {}

/// Initial state
class InitialState extends InternetState {
  @override
  String toString() => 'InternetState(InitialState)';
}

/// Internet connected
class Connected extends InternetState {
  @override
  String toString() => 'InternetState(Connected)';
}

/// Internet disconnected
class Disconnected extends InternetState {
  /// Initializes
  Disconnected({this.isWebSocketClosed = false});

  /// True if webSocket is closed
  final bool isWebSocketClosed;

  @override
  String toString() => 'InternetState(Disconnected)';
}
