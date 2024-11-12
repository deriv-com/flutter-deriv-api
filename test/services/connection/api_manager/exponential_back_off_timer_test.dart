import 'package:flutter_deriv_api/services/connection/api_manager/exponential_back_off_timer.dart';
import 'package:test/test.dart';
import 'package:fake_async/fake_async.dart';

void main() {
  group('ExponentialBackoffTimer', () {
    late Duration initialInterval;
    late Duration maxInterval;
    late int actionCount;
    late ExponentialBackoffTimer timer;

    setUp(() {
      initialInterval = const Duration(milliseconds: 500);
      maxInterval = const Duration(seconds: 5);
      actionCount = 0;

      timer = ExponentialBackoffTimer(
        initialInterval: initialInterval,
        maxInterval: maxInterval,
        onDoAction: () => actionCount++,
      );
    });

    test('should trigger onDoAction at initial interval', () {
      fakeAsync((FakeAsync async) {
        timer.start();
        expect(actionCount, equals(0));

        async.elapse(initialInterval);
        expect(actionCount, equals(1));
      });
    });

    test('should exponentially increase interval up to maxInterval', () {
      fakeAsync((FakeAsync async) {
        timer.start();
        expect(actionCount, equals(0));

        // First interval should be initialInterval
        async.elapse(initialInterval);
        expect(actionCount, equals(1));

        // Second interval should be double initialInterval, 1s
        async.elapse(initialInterval * 2);
        expect(actionCount, equals(2));

        // Next action callback should be in 4 * initialInterval, we check if
        // after 1 * initialInterval, the action is not triggered yet and same
        // value still.
        async.elapse(initialInterval);
        expect(actionCount, equals(2));

        // waiting for 3 * initialInterval more, the action should be triggered
        async.elapse(initialInterval * 4);
        expect(actionCount, equals(3));

        // Next interval should reach maxInterval
        async.elapse(maxInterval);
        expect(actionCount, equals(4));

        // Check that interval does not exceed maxInterval
        async.elapse(maxInterval);
        expect(actionCount, equals(5));
      });
    });

    test('should stop and reset interval when stop() is called', () {
      fakeAsync((FakeAsync async) {
        timer.start();

        async.elapse(initialInterval);
        expect(actionCount, equals(1));

        timer.stop();
        expect(timer.isActive, isFalse);

        // After stopping, action should not increase
        async.elapse(maxInterval);
        expect(actionCount, equals(1));

        // Restarting should reset interval to initialInterval
        timer.start();
        async.elapse(initialInterval);
        expect(actionCount, equals(2));
      });
    });

    test('isActive should be true only when timer is running', () {
      fakeAsync((FakeAsync async) {
        expect(timer.isActive, isFalse);

        timer.start();
        expect(timer.isActive, isTrue);

        timer.stop();
        expect(timer.isActive, isFalse);
      });
    });
  });
}
