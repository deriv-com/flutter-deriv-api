import 'dart:ui';

/// A timer calls the provided [onDoAction] callback every time the
/// interval elapses, allowing you to perform the action without needing to
/// manually handle the timing logic.
abstract class ConnectionTimer {
  /// Creates a [ConnectionTimer] with a specified [interval], and an
  /// [onDoAction] callback.
  ConnectionTimer({
    required this.onDoAction,
    required this.interval,
  });

  /// The initial interval duration between consecutive actions.
  final Duration interval;

  /// The callback function to be executed at each timer interval.
  final VoidCallback onDoAction;

  /// Returns `true` if the timer is active, otherwise `false`.
  bool get isActive;

  /// Starts the  timer.
  ///
  /// The [onDoAction] callback will be triggered based on the [interval].
  void start();

  /// Stops the timer.
  void stop();
}
