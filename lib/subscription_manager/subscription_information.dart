import 'dart:async';

/// Subscription information
class SubscriptionInformation<T> {
  /// Class constructor
  SubscriptionInformation({
    String id,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
  })  : _id = id,
        _stream = stream,
        _streamSubscription = streamSubscription;

  final String _id;
  final Stream<T> _stream;
  final StreamSubscription<T> _streamSubscription;

  /// Get subscription information id
  String get id => _id;

  /// Get subscription information stream
  Stream<T> get stream => _stream;

  /// Get subscription information stream subscription
  StreamSubscription<T> get streamSubscription => _streamSubscription;

  /// Update desired class fields
  SubscriptionInformation<T> copyWith({
    String id,
    Stream<T> stream,
    StreamSubscription<T> streamSubscription,
  }) =>
      SubscriptionInformation<T>(
        id: id ?? _id,
        stream: stream ?? _stream,
        streamSubscription: streamSubscription ?? _streamSubscription,
      );
}
