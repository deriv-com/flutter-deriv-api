part of 'deriv_connection_bloc.dart';

@immutable
abstract class DerivConnectionEvent {}

class Connect extends DerivConnectionEvent {
  final BinaryAPI api;

  Connect({this.api});

  @override
  String toString() => 'DerivConnectionEvent(Connect)';
}

class Disconnect extends DerivConnectionEvent {
  @override
  String toString() => 'DerivConnectionEvent(Disconnect)';
}

class Reconnect extends DerivConnectionEvent {
  @override
  String toString() => 'DerivConnectionEvent(Reconnect)';
}

class FetchServerTime extends DerivConnectionEvent {
  @override
  String toString() => 'DerivConnectionEvent(FetchServerTime)';
}
