part of 'connection_bloc.dart';

/// Connection base events.
abstract class ConnectionEvent {}

/// Connection connect event, add this event when we are connected to the websocket.
class ConnectionConnectEvent extends ConnectionEvent {
  /// Initializes connection connect event.
  ConnectionConnectEvent();

  @override
  String toString() => 'ConnectionEvent: ConnectionConnectEvent';
}

/// Connection disconnect event, add this when want to disconnect websocket.
class ConnectionDisconnectEvent extends ConnectionEvent {
  /// Initializes disconnect state.
  ConnectionDisconnectEvent({@required this.isWebSocketClosed});

  /// True if webSocket is closed.
  final bool isWebSocketClosed;

  @override
  String toString() => 'ConnectionEvent: ConnectionDisconnectEvent';
}

/// Connection reconnect event, reconnect to websocket.
class ConnectionReconnectEvent extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent: ConnectionReconnectEvent';
}

/// Connection display error event.
class ConnectionDisplayErrorEvent extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent: ConnectionDisplayErrorEvent';
}

/// Connection reconfigure event, when [ConnectionInformation] of the bloc changes.
class ConnectionReconfigureEvent extends ConnectionEvent {
  /// Initializes connection reconfigure event.
  ConnectionReconfigureEvent(this.connectionInformation);

  /// New connection information to connect.
  final ConnectionInformation connectionInformation;

  @override
  String toString() => 'ConnectionEvent: ConnectionReconfigureEvent';
}

/// Connection reconnecting event, Attempting to reconnect to websocket is in progress event.
class ConnectionReconnectingEvent extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent: ConnectionReconnectingEvent';
}
