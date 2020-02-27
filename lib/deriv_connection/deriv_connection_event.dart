part of 'deriv_connection_bloc.dart';

///
@immutable
abstract class DerivConnectionEvent {}

/// add this event when we are connected to the WS
class Connect extends DerivConnectionEvent {
  ///
  Connect({this.api});

  ///
  final BinaryAPI api;


  @override
  String toString() => 'DerivConnectionEvent(Connect)';
}

/// add this when want to disconnect WS
class Disconnect extends DerivConnectionEvent {
  @override
  String toString() => 'DerivConnectionEvent(Disconnect)';
}

/// reconnect to WS
class Reconnect extends DerivConnectionEvent {
  @override
  String toString() => 'DerivConnectionEvent(Reconnect)';
}

/// when added, bloc will fetch the server time and will update the serverTime
/// in [Connected] state
class FetchServerTime extends DerivConnectionEvent {
  @override
  String toString() => 'DerivConnectionEvent(FetchServerTime)';
}
