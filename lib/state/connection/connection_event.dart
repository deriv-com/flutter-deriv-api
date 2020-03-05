part of 'connection_bloc.dart';

/// Connection Events
@immutable
abstract class ConnectionEvent {}

/// add this event when we are connected to the WS
class Connect extends ConnectionEvent {
  /// Initializes
  Connect({this.api});

  /// A reference to BinaryAPI
  final BinaryAPI api;

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

/// when added, bloc will fetch the server time and will update the serverTime
/// in [Connected] state
class FetchServerTime extends ConnectionEvent {
  @override
  String toString() => 'ConnectionEvent(FetchServerTime)';
}
