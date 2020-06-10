part of 'ticks_bloc.dart';

abstract class TicksEvent {}

class SubscribeTicks extends TicksEvent {
  SubscribeTicks(this.selectedSymbol);

  final ActiveSymbol selectedSymbol;

  @override
  String toString() => 'SubscribeTicks';
}

class YieldTick extends TicksEvent {
  YieldTick(this.tick);

  final Tick tick;

  @override
  String toString() => 'YieldTicks $tick';
}

class YieldError extends TicksEvent {
  YieldError(this.message);

  final String message;

  @override
  String toString() => 'Tick $message';
}