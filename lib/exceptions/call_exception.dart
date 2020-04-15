/// Call exception class
class CallException implements Exception {
  /// Class constructor
  CallException({
    this.message,
  });

  /// Exception message
  String message;

  @override
  String toString() => 'Call Exception: $message';
}
