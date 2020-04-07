import 'dart:async';

import 'package:flutter_deriv_api/connection/subscription_information.dart';

/// Represent a pending request.
class PendingRequest<T> {
  /// Initializes
  PendingRequest({this.method, this.request, this.response});

  /// api call method (e.g. 'active_symbols')
  final String method;

  /// Map of the sent request
  final Map<String, dynamic> request;

  /// this completer will complete whenever the response of the request arrives
  final Completer<T> response;

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
