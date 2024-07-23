part of 'sync_time_cubit.dart';

/// Sync time base state.
abstract class SyncTimeState {
  /// Initializes sync time base state.
  const SyncTimeState(this.dateTime);

  /// Keeps synced Date Time in UTC.
  final DateTime dateTime;
}

/// Sync time initial state.
class SyncTimeInitialState extends SyncTimeState {
  /// Initializes sync time initial state.
  SyncTimeInitialState() : super(DateTime.now().toUtc());
}

/// Sync time updates state.
class SyncTimeUpdatedState extends SyncTimeState {
  /// Initializes sync time updated state.
  SyncTimeUpdatedState(DateTime dateTime) : super(dateTime);
}
