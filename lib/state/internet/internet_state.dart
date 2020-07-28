part of 'internet_bloc.dart';

/// Internet state
abstract class InternetState {}

/// Initial Internet state
class InternetStateUninitialized extends InternetState {
  @override
  String toString() => 'InternetStateUninitialized';
}

/// Internet connected
class Connected extends InternetState {
  @override
  String toString() => 'InternetState: Connected';
}

/// Internet disconnected
class Disconnected extends InternetState {
  /// Initializes
  Disconnected({this.isWebSocketClosed = false});

  /// True if webSocket is closed
  final bool isWebSocketClosed;

  @override
  String toString() => 'InternetState: Disconnected';
}
