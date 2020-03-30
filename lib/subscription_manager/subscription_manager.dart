import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/subscription_manager/subscription_exception.dart';
import 'package:flutter_deriv_api/subscription_manager/subscription_information.dart';

/// Subscription manager class
class SubscriptionManager {
  SubscriptionManager._();

  /// Get subscription manager class instance
  static SubscriptionManager get getInstance =>
      _instance = _instance ?? SubscriptionManager._();

  static SubscriptionManager _instance;

  static final Map<String, SubscriptionInformation<Object>> _subscriptions =
      <String, SubscriptionInformation<Object>>{};

  /// Get subscription [id] by [key] in subscribe manager
  String getId(String key) => _subscriptions[key]?.id;

  /// Get [stream] by [key] in subscribe manager
  Stream<Object> getStream(String key) => _subscriptions[key]?.stream;

  /// Get [streamSubscription] by [key] in subscribe manager
  StreamSubscription<Object> getStreamSubscription(String key) =>
      _subscriptions[key]?.streamSubscription;

  /// Add subscription information to subscribe manager
  void add<T>({
    @required String key,
    String subscriptionId,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
  }) {
    if (_subscriptions.containsKey(key)) {
      throw SubscriptionException(
        message: 'mapping already present for "$key"',
      );
    }

    _subscriptions[key] = SubscriptionInformation<T>(
      id: subscriptionId,
      stream: stream,
      streamSubscription: streamSubscription,
    );
  }

  /// Set subscription [id] for subscription information
  void setId({
    @required String key,
    @required String id,
  }) {
    if (_subscriptions.containsKey(key)) {
      _subscriptions[key] = _subscriptions[key].copyWith(id: id);
    } else {
      throw SubscriptionException(
        message: 'cannot find subscription information for "$key"',
      );
    }
  }

  /// Set [stream] for subscription information
  void setStream<T>({
    @required String key,
    @required Stream<T> stream,
  }) {
    if (_subscriptions.containsKey(key)) {
      _subscriptions[key] = _subscriptions[key].copyWith(stream: stream);
    } else {
      throw SubscriptionException(
        message: 'cannot find subscription information for "$key"',
      );
    }
  }

  /// Set [streamSubscription] for subscription information
  void setStreamSubscription<T>({
    @required String key,
    @required StreamSubscription<T> streamSubscription,
  }) {
    if (_subscriptions.containsKey(key)) {
      _subscriptions[key] = _subscriptions[key].copyWith(
        streamSubscription: streamSubscription,
      );
    } else {
      throw SubscriptionException(
        message: 'cannot find subscription information for "$key"',
      );
    }
  }

  /// Clear subscription [id]
  void clearId(String key) => setId(key: key, id: null);

  /// Dispose subscription and close stream by [key]
  Future<void> dispose(String key) async {
    clearId(key);

    await _subscriptions[key]?.streamSubscription?.cancel();

    _subscriptions.remove(key);
  }

  /// Dispose all subscriptions and close streams
  Future<void> disposeAll() async => _subscriptions.forEach(
        (String key, SubscriptionInformation<Object> subscriptionInformation) =>
            dispose(key),
      );

  /// Indicates [key] has any subscription information or not
  bool hasSubscription(String key) => getId(key) != null;
}
