part of 'internet_bloc.dart';

/// Internet event
abstract class InternetEvent {}

/// Offline
class Offline extends InternetEvent {
  @override
  String toString() => 'InternetEvent: Offline';
}

/// Online
class Online extends InternetEvent {
  @override
  String toString() => 'InternetEvent: Online';
}

/// SocketConnected
class SocketConnected extends InternetEvent {
  @override
  String toString() => 'InternetEvent: SocketConnected';
}

/// SocketDisconnected
class SocketDisconnected extends InternetEvent {
  @override
  String toString() => 'InternetEvent: SocketDisconnected';
}
