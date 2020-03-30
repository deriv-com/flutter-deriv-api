import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/subscription_manager/subscription_type.dart';
import 'package:flutter_deriv_api/subscription_manager/subscription_exception.dart';

/// Subscription manager class
class SubscriptionManager {
  SubscriptionManager._();

  /// Get subscription manager class instance
  static SubscriptionManager get getInstance =>
      _instance = _instance ?? SubscriptionManager._();

  static SubscriptionManager _instance;

  static final Map<String, SubscriptionType<Object>> _subscriptions =
      <String, SubscriptionType<Object>>{};

  /// Get subscription id for [key]
  String getId(String key) => _subscriptions[key]?.id;

  /// Get stream for [key]
  Stream<Object> getStream(String key) => _subscriptions[key]?.stream;

  /// Get stream subscription for [key]
  StreamSubscription<Object> getStreamSubscription(String key) =>
      _subscriptions[key]?.streamSubscription;

  /// Add subscription information to manager
  void add<T>({
    @required String key,
    String subscriptionId,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
  }) {
    if (_subscriptions.containsKey(key)) {
      throw SubscriptionException(
        message: 'mapping already present for type "$key"',
      );
    }

    _subscriptions[key] = SubscriptionType<T>(
      id: subscriptionId,
      stream: stream,
      streamSubscription: streamSubscription,
    );
  }

  /// Set subscription id
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

  /// Set  stream
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

  /// Set stream subscription
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

  /// Clear subscription id
  void clearId(String key) => setId(key: key, id: null);

  /// Dispose subscription and close stream
  Future<void> dispose(String key) async {
    clearId(key);

    await _subscriptions[key]?.streamSubscription?.cancel();

    _subscriptions.remove(key);
  }

  /// Dispose all subscription and close stream
  Future<void> disposeAll() async => _subscriptions.forEach(
        (String key, SubscriptionType<Object> subscriptionType) => dispose(key),
      );

  /// indicates [key] has any subscription information or not
  bool hasSubscription(String key) => getId(key) != null;
}
