part of 'ticks_bloc.dart';

abstract class TicksState {
  TicksState();
}

class TicksLoading extends TicksState {
  @override
  String toString() => 'TicksLoading';
}

class TicksError extends TicksState {
  TicksError(this.message);

  final String message;

  @override
  String toString() => 'TicksError';
}

class TicksLoaded extends TicksState {
  TicksLoaded(this.tick);

  final Tick tick;

  @override
  String toString() => 'Tick $tick loaded';
}
