import 'dart:async';

import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/subscription_stream.dart';

/// Represent a pending request.
class PendingSubscribeRequest<T> extends PendingRequest<T> {
  /// Class constructor
  PendingSubscribeRequest({
    Map<String, dynamic> request,
    Completer<T> response,
  }) : super(request: request, response: response);

  /// Subscription id
  String subscriptionId;

  /// Subscription stream
  SubscriptionStream<T> subscriptionStream;

  /// Get subscription state
  bool get isSubscribed => subscriptionStream != null;
}
