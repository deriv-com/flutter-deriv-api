import 'dart:async';

import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/subscription_stream.dart';

/// Represent a pending request.
class PendingSubscribeRequest<T> extends PendingRequest<T> {
  /// Class constructor
  PendingSubscribeRequest({
    Map<String, dynamic> request,
    Completer<T> response,
    this.subscriptionId,
    this.subscriptionStream,
  }) : super(
          request: request,
          response: response,
        );

  /// Subscription id
  final String subscriptionId;

  /// Subscription stream
  final SubscriptionStream<T> subscriptionStream;

  /// Get subscription state
  bool get isSubscribed => subscriptionStream != null;

  /// Creates copy of instance with given parameters
  PendingSubscribeRequest<T> copyWith({
    String subscriptionId,
    SubscriptionStream<T> subscriptionStream,
  }) =>
      PendingSubscribeRequest<T>(
        subscriptionId: subscriptionId ?? this.subscriptionId,
        subscriptionStream: subscriptionStream ?? this.subscriptionStream,
      );
}
