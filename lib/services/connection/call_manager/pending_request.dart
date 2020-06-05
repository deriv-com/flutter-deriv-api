import 'dart:async';

import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_stream.dart';

/// Represent a pending request.
class PendingRequest<T> {
  /// Initializes
  PendingRequest({
    this.listenersCount = 1,
    this.request,
    this.responseCompleter,
    this.subscriptionId,
    this.subscriptionStream,
  });

  /// Listeners count for stream response
  final int listenersCount;

  /// Map of the sent request
  final Request request;

  /// This completer will complete whenever the response of the request arrives
  final Completer<T> responseCompleter;

  /// Subscription id
  final String subscriptionId;

  /// Subscription stream
  final SubscriptionStream<T> subscriptionStream;

  /// Get subscription state
  bool get isSubscribed => subscriptionStream != null;

  /// Creates a copy of instance with given parameters
  PendingRequest<T> copyWith({
    int listenersCount,
    Request request,
    Completer<T> responseCompleter,
    String subscriptionId,
    SubscriptionStream<T> subscriptionStream,
  }) =>
      PendingRequest<T>(
        listenersCount: listenersCount ?? this.listenersCount,
        request: request ?? this.request,
        responseCompleter: responseCompleter ?? this.responseCompleter,
        subscriptionId: subscriptionId ?? this.subscriptionId,
        subscriptionStream: subscriptionStream ?? this.subscriptionStream,
      );
}
