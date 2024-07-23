import 'dart:async';

import 'package:test/test.dart';

import 'package:flutter_deriv_api/services/connection/call_manager/subscription_stream.dart';

void main() {
  group('SubscriptionStream tests =>', () {
    late SubscriptionStream<String> subscriptionStream;

    setUp(() {
      subscriptionStream = SubscriptionStream<String>();
    });

    tearDown(() {
      subscriptionStream.closeStream();
    });

    test('should add and broadcast a new message.', () async {
      const String expectedMessage = 'Test message';
      final List<String> messages = <String>[];
      final Completer<void> completer = Completer<void>();

      subscriptionStream.stream.listen((String message) {
        messages.add(message);

        completer.complete();
      });

      subscriptionStream.add(expectedMessage);

      await completer.future;

      expect(messages.length, 1);
      expect(messages.first, expectedMessage);
    });

    test('should return true if the stream has listener.', () {
      final StreamSubscription<String> listener =
          subscriptionStream.stream.listen((_) {});

      expect(subscriptionStream.hasListener, isTrue);

      listener.cancel();

      expect(subscriptionStream.hasListener, isFalse);
    });

    test('should return the stream object.', () {
      expect(subscriptionStream.stream, isA<Stream<String>>());
    });

    test('should return the sink object of the stream.', () {
      expect(subscriptionStream.sink, isA<StreamSink<String>>());
    });

    test('should close the stream.', () async {
      final Completer<void> closedCompleter = Completer<void>();

      subscriptionStream.stream.listen(null, onDone: () {
        closedCompleter.complete();
      });

      await subscriptionStream.closeStream();

      expect(closedCompleter.future, completes);
    });
  });
}
