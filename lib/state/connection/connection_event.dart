part of 'connection_bloc.dart';

/// Connection Events
@immutable
abstract class ConnectionEvent {}

/// add this event when we are connected to the WS
class Connect extends ConnectionEvent {
  /// Initializes
  Connect();

  @override
  String toString() => 'ConnectionEvent(Connect)';
}

/// add this when want to disconnect WS
class Disconnect extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent(Disconnect)';
}

/// reconnect to WS
class Reconnect extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent(Reconnect)';
}
