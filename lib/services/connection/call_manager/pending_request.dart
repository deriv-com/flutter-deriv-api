import 'dart:async';

import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_stream.dart';

/// Represent a pending request.
class PendingRequest<T> {
  /// Initializes
  PendingRequest({
    this.request,
    this.response,
    this.subscriptionId,
    this.subscriptionStream,
  });

  /// Map of the sent request
  final Request request;

  /// This completer will complete whenever the response of the request arrives
  final Completer<T> response;

  /// Subscription id
  final String subscriptionId;

  /// Subscription stream
  final SubscriptionStream<T> subscriptionStream;

  /// Get subscription state
  bool get isSubscribed => subscriptionStream != null;

  /// Creates a copy of instance with given parameters
  PendingRequest<T> copyWith({
    Request request,
    Completer<T> response,
    String subscriptionId,
    SubscriptionStream<T> subscriptionStream,
  }) =>
      PendingRequest<T>(
        request: request ?? this.request,
        response: response ?? this.response,
        subscriptionId: subscriptionId ?? this.subscriptionId,
        subscriptionStream: subscriptionStream ?? this.subscriptionStream,
      );
}
