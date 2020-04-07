import 'package:flutter_deriv_api/connection/subscription_stream.dart';

/// Subscription information class
class SubscriptionInformation<T> {
  /// Class constructor
  SubscriptionInformation({
    this.subscriptionId,
    this.subscriptionStream,
  });

  /// Subscription id
  String subscriptionId;

  /// Subscription stream
  SubscriptionStream<T> subscriptionStream;
}
