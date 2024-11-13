import 'dart:async';

import 'connection_timer.dart';

/// A timer utility that implements an exponential back-off strategy for
/// recurring actions.
///
/// This class is useful for scenarios where you need send a request to a server
/// and you don't want to flood the server with too many frequent requests.
///
/// The timer will call the provided [onDoAction] callback every time the
/// interval elapses, allowing you to perform the action without needing to
/// manually handle the timing logic.
class ExponentialBackoffTimer extends ConnectionTimer {
  /// Creates an [ExponentialBackoffTimer] with a specified [initialInterval],
  /// [maxInterval], and an [onDoAction] callback.
  ///
  /// - [initialInterval]: The starting interval between consecutive actions.
  /// - [maxInterval]: The upper limit for the interval. Once reached,
  ///                  the interval will no longer increase.
  /// - [onDoAction]: The callback function that will be executed at each
  ///                  interval.
  /// Example usage:
  /// ```dart
  /// final timer = ExponentialBackoffTimer(
  ///   initialInterval: Duration(milliseconds: 500),
  ///   maxInterval: Duration(seconds: 10),
  ///   onDoAction: () {
  ///     print('Ping request sent');
  ///   },
  /// );
  /// timer.start();
  /// ```
  ExponentialBackoffTimer({
    required this.initialInterval,
    required this.maxInterval,
    required super.onDoAction,
  })  : _currentInterval = initialInterval,
        super(interval: initialInterval);

  /// The initial interval duration between consecutive actions.
  final Duration initialInterval;

  /// The maximum interval duration for the exponential back-off.
  final Duration maxInterval;

  Timer? _timer;
  Duration _currentInterval;

  /// Returns `true` if the timer is active, otherwise `false`.
  @override
  bool get isActive => _timer?.isActive ?? false;

  /// Starts the exponential back-off timer.
  ///
  /// The [onDoAction] callback will be triggered at the initial interval,
  /// and the interval will double after each execution up to [maxInterval].
  @override
  void start() => _setupTimer();

  /// Stops the timer and resets the interval to the initial interval.
  @override
  void stop() {
    _timer?.cancel();
    _currentInterval = initialInterval;
  }

  void _restartTimer() {
    _timer?.cancel();
    _setupTimer();
  }

  void _setupTimer() {
    _timer = Timer(_currentInterval, () {
      onDoAction();
      _increaseInterval();
      _restartTimer();
    });
  }

  /// Doubles the current interval for the next action, up to the maximum
  /// allowed interval.
  void _increaseInterval() {
    _currentInterval = Duration(
      milliseconds: (_currentInterval.inMilliseconds * 2).clamp(
        initialInterval.inMilliseconds,
        maxInterval.inMilliseconds,
      ),
    );
  }
}
