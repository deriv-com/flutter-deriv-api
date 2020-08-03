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