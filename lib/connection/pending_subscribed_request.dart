import 'dart:async';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/subscription_stream.dart';

/// Represent a pending request.
class PendingSubscribedRequest<T> extends PendingRequest<T> {
  /// Class constructor
  PendingSubscribedRequest({
    Request request,
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
  PendingSubscribedRequest<T> copyWith({
    String subscriptionId,
    SubscriptionStream<T> subscriptionStream,
  }) =>
      PendingSubscribedRequest<T>(
        subscriptionId: subscriptionId ?? this.subscriptionId,
        subscriptionStream: subscriptionStream ?? this.subscriptionStream,
      );
}
