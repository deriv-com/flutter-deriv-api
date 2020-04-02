import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/subscription_manager/subscription_exception.dart';
import 'package:flutter_deriv_api/subscription_manager/subscription_information.dart';

const String _defaultKey = 'default';

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
  String getId<T>({String key = _defaultKey}) =>
      _subscriptions[_generateKey(type: T, key: key)]?.id;

  /// Get [stream] by [key] in subscribe manager
  Stream<T> getStream<T>({String key = _defaultKey}) =>
      _subscriptions[_generateKey(type: T, key: key)]?.stream;

  /// Get [streamSubscription] by [key] in subscribe manager
  StreamSubscription<T> getStreamSubscription<T>({String key = _defaultKey}) =>
      _subscriptions[_generateKey(type: T, key: key)]?.streamSubscription;

  /// Add subscription information to subscribe manager
  void add<T>({
    String subscriptionId,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
    String key = _defaultKey,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_subscriptions.containsKey(objectKey)) {
      throw SubscriptionException(
        message: 'mapping already present for "$objectKey"',
      );
    }

    _subscriptions[objectKey] = SubscriptionInformation<T>(
      id: subscriptionId,
      stream: stream,
      streamSubscription: streamSubscription,
    );
  }

  /// Set subscription [id] for subscription information
  void setId<T>({
    @required String id,
    String key = _defaultKey,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_subscriptions.containsKey(objectKey)) {
      _subscriptions[objectKey] = _subscriptions[objectKey].copyWith(id: id);
    } else {
      throw SubscriptionException(
        message: 'cannot find subscription information for "$objectKey"',
      );
    }
  }

  /// Set [stream] for subscription information
  void setStream<T>({
    @required Stream<T> stream,
    String key = _defaultKey,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_subscriptions.containsKey(objectKey)) {
      _subscriptions[objectKey] =
          _subscriptions[objectKey].copyWith(stream: stream);
    } else {
      throw SubscriptionException(
        message: 'cannot find subscription information for "$objectKey"',
      );
    }
  }

  /// Set [streamSubscription] for subscription information
  void setStreamSubscription<T>({
    @required StreamSubscription<T> streamSubscription,
    String key = _defaultKey,
  }) {
    final String objectKey = _generateKey(type: T, key: key);

    if (_subscriptions.containsKey(objectKey)) {
      _subscriptions[objectKey] = _subscriptions[objectKey].copyWith(
        streamSubscription: streamSubscription,
      );
    } else {
      throw SubscriptionException(
        message: 'cannot find subscription information for "$objectKey"',
      );
    }
  }

  /// Dispose subscription and close stream by [key]
  Future<void> dispose<T>({String key = _defaultKey}) async {
    final String objectKey = _generateKey(type: T, key: key);

    _clearId<T>(key: key);

    await _subscriptions[objectKey]?.streamSubscription?.cancel();

    _subscriptions.remove(objectKey);
  }

  /// Dispose all subscriptions and close streams
  Future<void> disposeAll<T>() async {
    final String keyForType =
        _generateKey(type: T).replaceFirst(_defaultKey, '');

    _subscriptions.forEach((
      String key,
      SubscriptionInformation<Object> subscriptionInformation,
    ) {
      if (key.contains(keyForType)) {
        dispose<T>(key: key.split('::').last);
      }
    });
  }

  /// Indicates [key] has any subscription information or not
  bool hasSubscription<T>({String key = _defaultKey}) =>
      getId<T>(key: key) != null;

  void _clearId<T>({String key = _defaultKey}) => setId<T>(id: null, key: key);

  String _generateKey<T>({@required T type, String key = _defaultKey}) =>
      '${type.toString()}::$key';
}
