part of 'ticks_bloc.dart';

/// TicksState
abstract class TicksState {
  /// Initializes
  TicksState();
}

/// TicksLoading
class TicksLoading extends TicksState {
  @override
  String toString() => 'TicksLoading...';
}

/// TicksError
class TicksError extends TicksState {
  /// Initializes
  TicksError(this.message);

  /// Error message
  final String? message;

  @override
  String toString() => 'TicksError';
}

/// TicksLoaded
class TicksLoaded extends TicksState {
  /// Initializes
  TicksLoaded(this.tick);

  /// Loaded tick
  final Tick? tick;

  @override
  String toString() => 'Tick $tick loaded';
}
