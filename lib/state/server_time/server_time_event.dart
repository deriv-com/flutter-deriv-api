part of 'server_time_bloc.dart';

/// Server time events
abstract class ServerTimeEvent {}

/// When added, bloc will fetch the server time
class FetchServerTime extends ServerTimeEvent {
  @override
  String toString() => 'ServerTimeEvent(FetchServerTime)';
}
