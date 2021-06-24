/// Subscription exception class
class CallManagerException implements Exception {
  /// Initializes
  CallManagerException({
    this.message,
  });

  /// Exception message
  String? message;

  @override
  String toString() => '$runtimeType: $message';
}
