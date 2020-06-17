part of 'ticks_bloc.dart';

/// TicksEvent
abstract class TicksEvent {}

/// SubscribeTicks
class SubscribeTicks extends TicksEvent {
  /// Initializes
  SubscribeTicks(this.selectedSymbol);

  /// Selected symbol
  final ActiveSymbol selectedSymbol;

  @override
  String toString() => 'SubscribeTicks';
}

/// YieldTick
class YieldTick extends TicksEvent {
  /// Initializes
  YieldTick(this.tick);

  /// Loaded tick
  final Tick tick;

  @override
  String toString() => 'YieldTicks $tick';
}

/// YieldError
class YieldError extends TicksEvent {
  /// Initializes
  YieldError(this.message);

  /// Error message
  final String message;

  @override
  String toString() => 'YieldError $message';
}