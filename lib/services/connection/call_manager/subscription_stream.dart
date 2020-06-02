import 'dart:async';
import 'package:rxdart/subjects.dart';

/// A source of subscription messages.
/// it provides a StreamController to broadcast new messages of a subscription request
/// to it's listener.
class SubscriptionStream<T> {
  /// Initializes
  SubscriptionStream({
    this.cacheSize,
  }) : _streamController = ReplaySubject<T>(maxSize: cacheSize);

  /// Stream cache size
  final int cacheSize;

  final ReplaySubject<T> _streamController;

  /// Returns true if the stream has listener
  bool get hasListener => _streamController.hasListener;

  /// Returns the stream object
  Stream<T> get stream => _streamController.stream;

  /// Returns the sink object of the stream.
  StreamSink<T> get sink => _streamController.sink;

  /// It used to broadcast a new message.
  void add(T message) => _streamController.add(message);

  /// Whenever the request is unsubscribed, this method will be invoked to broadcast cast done message to all of its listeners.
  Future<void> closeStream() async {
    await _streamController.close();
  }
}
