import 'dart:async';

import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/subscription_information.dart';

/// Represent a pending request.
class PendingSubscribeRequest<T> extends PendingRequest<T> {
  /// Class constructor
  PendingSubscribeRequest({
    Map<String, dynamic> request,
    Completer<T> response,
  }) : super(request: request, response: response);

  /// subscription information
  SubscriptionInformation<T> _subscription;

  /// Get subscription information
  SubscriptionInformation<T> get subscription => _subscription;

  /// Get subscription state
  bool get isSubscribed => _subscription?.subscriptionStream != null;

  /// Set subscription information
  set subscription(SubscriptionInformation<T> subscription) =>
      _subscription = _subscription;
}
