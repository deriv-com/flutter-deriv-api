import 'dart:async';

/// Subscription type
class SubscriptionType<T> {
  /// Class constructor
  SubscriptionType({
    String id,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
  })  : _id = id,
        _stream = stream,
        _streamSubscription = streamSubscription;

  final String _id;
  final Stream<T> _stream;
  final StreamSubscription<T> _streamSubscription;

  /// Get subscription type id
  String get id => _id;

  /// Get subscription type stream
  Stream<T> get stream => _stream;

  /// Get subscription tpe stream subscription
  StreamSubscription<T> get streamSubscription => _streamSubscription;

  /// Update desired class fields
  SubscriptionType<T> copyWith({
    String id,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
  }) =>
      SubscriptionType<T>(
        id: id ?? _id,
        stream: stream ?? _stream,
        streamSubscription: streamSubscription ?? _streamSubscription,
      );
}
