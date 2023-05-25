import 'dart:async';

import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/pending_request.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_stream.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PendingRequest tests =>', () {
    late PendingRequest<int> pendingRequest;

    setUp(() {
      pendingRequest = PendingRequest<int>(
        listenersCount: 2,
        request: const Request(),
        responseCompleter: Completer<int>(),
        subscriptionId: 'subscriptionId',
        subscriptionStream: SubscriptionStream<int>(),
      );
    });

    test(
        'PendingRequest copyWith should return a new instance with updated properties.',
        () {
      const Request updatedRequest = Request();

      final Completer<int> updatedCompleter = Completer<int>();
      final SubscriptionStream<int> updatedSubscriptionStream =
          SubscriptionStream<int>();

      final PendingRequest<int> updatedPendingRequest = pendingRequest.copyWith(
        listenersCount: 3,
        request: updatedRequest,
        responseCompleter: updatedCompleter,
        subscriptionId: 'updatedSubscriptionId',
        subscriptionStream: updatedSubscriptionStream,
      );

      expect(updatedPendingRequest.listenersCount, equals(3));
      expect(updatedPendingRequest.request, equals(updatedRequest));
      expect(updatedPendingRequest.responseCompleter, equals(updatedCompleter));
      expect(
        updatedPendingRequest.subscriptionId,
        equals('updatedSubscriptionId'),
      );
      expect(
        updatedPendingRequest.subscriptionStream,
        equals(updatedSubscriptionStream),
      );
    });

    test(
        'PendingRequest copyWith should not update instance with updated properties if values are null.',
        () {
      const Request request = Request();

      final Completer<int> completer = Completer<int>();
      final SubscriptionStream<int> subscriptionStream =
          SubscriptionStream<int>();

      final PendingRequest<int> pendingRequest = PendingRequest<int>(
        listenersCount: 2,
        request: request,
        responseCompleter: completer,
        subscriptionId: 'subscriptionId',
        subscriptionStream: subscriptionStream,
      );

      final PendingRequest<int> updatedPendingRequest = pendingRequest.copyWith(
        listenersCount: null,
        request: null,
        responseCompleter: null,
        subscriptionId: null,
        subscriptionStream: null,
      );

      expect(
        updatedPendingRequest.listenersCount,
        equals(pendingRequest.listenersCount),
      );
      expect(updatedPendingRequest.request, equals(pendingRequest.request));
      expect(
        updatedPendingRequest.responseCompleter,
        equals(pendingRequest.responseCompleter),
      );
      expect(
        updatedPendingRequest.subscriptionId,
        equals(pendingRequest.subscriptionId),
      );
      expect(
        updatedPendingRequest.subscriptionStream,
        equals(pendingRequest.subscriptionStream),
      );
    });

    test(
        'PendingRequest isSubscribed should return true if subscriptionStream is not null.',
        () {
      expect(pendingRequest.isSubscribed, isTrue);
      expect(PendingRequest<int>().isSubscribed, isFalse);
    });
  });
}
