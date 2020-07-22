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

/// DisplayConnectionError
class DisplayConnectionError extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent(DisplayConnectionError)';
}

/// When [ConnectionInformation] of the bloc changes
class Reconfigure extends ConnectionEvent {
  /// Initializes
  Reconfigure(this.connectionInformation);

  /// New connection information to connect
  final ConnectionInformation connectionInformation;

  @override
  String toString() => 'ConnectionEvent(Reconfigure)';
}
