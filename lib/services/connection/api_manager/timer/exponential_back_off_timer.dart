import 'dart:async';

import 'connection_timer.dart';

/// A timer utility that implements a simple exponential back-off strategy for
/// recurring actions and increases the interval between actions until a
/// maximum interval duration is reached.
///
/// This class is useful for scenarios where you need send a request to a server
/// and you don't want to flood the server with too many frequent requests.
///
/// The timer will call the provided [onDoAction] callback every time the
/// interval elapses, allowing you to perform the action without needing to
/// manually handle the timing logic.
class ExponentialBackoffTimer extends ConnectionTimer {
  /// Creates an [ExponentialBackoffTimer] with a specified
  /// [initialInterval], [maxInterval], and an [onDoAction] callback.
  ///
  /// - [initialInterval]: The starting interval between consecutive actions.
  /// - [maxInterval]: The upper limit for the interval. Once reached,
  ///                  the interval will no longer increase.
  /// - [onDoAction]: The callback function that will be executed at each
  ///                  interval.
  /// - [multiplier]: Factor by which the interval increases after each attempt.
  ///                 Default is `2.0`.
  /// - [jitter]: If `true`, adds random jitter (±15%) to the interval to reduce
  ///                 server load spikes. Default is `true`.
  /// - [maxAttempts]: Optional limit on the number of attempts; stops the timer
  ///                 if exceeded.
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
    this.multiplier = 2.0,
    this.jitter = true,
    this.maxAttempts,
  })  : _currentInterval = initialInterval,
        super(interval: initialInterval);

  /// The initial interval duration between consecutive actions.
  final Duration initialInterval;

  /// The maximum interval duration for the exponential back-off.
  final Duration maxInterval;

  /// The factor by which the interval increases after each attempt.
  final double multiplier;

  /// If `true`, adds random jitter (±15%) to the interval to reduce server
  final bool jitter;

  /// Optional limit on the number of attempts; stops the timer
  /// if exceeded.
  final int? maxAttempts;

  int _attemptCount = 0;

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
  void start() {
    _reset();
    _setupTimer();
  }

  /// Stops the timer and resets the interval to the initial interval.
  @override
  void stop() => _reset();

  void _reset() {
    _attemptCount = 0;
    _timer?.cancel();
    _currentInterval = initialInterval;
  }

  void _restartTimer() {
    _timer?.cancel();
    _setupTimer();
  }

  void _setupTimer() {
    if (maxAttempts != null && _attemptCount >= maxAttempts!) {
      return;
    }

    _timer = Timer(_currentInterval, () {
      _attemptCount++;
      onDoAction();
      _increaseInterval();
      _restartTimer();
    });
  }

  /// Increases the current interval for the next action [multiplier] times,
  /// up to the maximum allowed interval.
  void _increaseInterval() {
    final int newInterval =
        (_currentInterval.inMilliseconds * multiplier).round();
    final int clampedInterval = newInterval.clamp(
      initialInterval.inMilliseconds,
      maxInterval.inMilliseconds,
    );

    if (jitter) {
      // Add random jitter of ±15% to prevent thundering herd problem
      final int jitterRange = (clampedInterval * 0.15).round();
      final int random =
          DateTime.now().millisecondsSinceEpoch % (jitterRange * 2) -
              jitterRange;
      _currentInterval = Duration(milliseconds: clampedInterval + random);
    } else {
      _currentInterval = Duration(milliseconds: clampedInterval);
    }
  }
}
