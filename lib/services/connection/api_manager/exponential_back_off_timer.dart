import 'dart:async';
import 'dart:ui';

/// A timer utility that implements an exponential back-off strategy for
/// recurring actions.
///
/// This class is useful for scenarios where you need send a request to a server
/// and you don't want to flood the server with too many frequent requests.
///
/// The timer will call the provided [onDoAction] callback every time the
/// interval elapses, allowing you to perform the action without needing to
/// manually handle the timing logic.
class ExponentialBackoffTimer {
  /// Creates an [ExponentialBackoffTimer] with a specified [initialInterval],
  /// [maxInterval], and an [onDoAction] callback.
  ///
  /// - [initialInterval]: The starting interval between consecutive actions.
  /// - [maxInterval]: The upper limit for the interval. Once reached,
  ///                  the interval will no longer increase.
  /// - [onPingRequest]: The callback function that will be executed at each
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
    required this.onDoAction,
  }) : _currentInterval = initialInterval;

  /// The initial interval duration between consecutive actions.
  final Duration initialInterval;

  /// The maximum interval duration for the exponential back-off.
  final Duration maxInterval;

  /// The callback function to be executed at each timer interval.
  ///
  /// This is typically where you place your recurring action, such as sending a ping.
  final VoidCallback onDoAction;

  Timer? _timer;
  Duration _currentInterval;

  /// Returns `true` if the timer is active, otherwise `false`.
  bool get isActive => _timer?.isActive ?? false;

  /// Starts the exponential back-off timer.
  ///
  /// The [onDoAction] callback will be triggered at the initial interval,
  /// and the interval will double after each execution up to [maxInterval].
  void start() {
    _timer = Timer.periodic(_currentInterval, (_) {
      onDoAction();
      _increaseInterval();
      _restartTimer();
    });
  }

  /// Stops the timer and resets the interval to the initial interval.
  ///
  /// This method can be used when you want to temporarily halt the recurring
  /// action without destroying the [ExponentialBackoffTimer] instance.
  void stop() {
    _timer?.cancel();
    _currentInterval = initialInterval;
  }

  /// Resets the timer, restoring the interval to the initial interval and restarting it.
  ///
  /// Useful for situations where you need to restart the exponential back-off process,
  /// such as after receiving a successful response from the server.
  void reset() {
    stop();
    start();
  }

  /// Doubles the current interval for the next action, up to the maximum allowed interval.
  void _increaseInterval() {
    _currentInterval = Duration(
      milliseconds: (_currentInterval.inMilliseconds * 2).clamp(
        initialInterval.inMilliseconds,
        maxInterval.inMilliseconds,
      ),
    );
  }

  /// Restarts the timer with the updated interval, applying the current exponential back-off delay.
  void _restartTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_currentInterval, (_) {
      onDoAction();
      _increaseInterval();
      _restartTimer();
    });
  }
}
