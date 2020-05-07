/// API manager exception class
class APIManagerException implements Exception {
  /// Initializes
  APIManagerException({
    this.message,
  });

  /// Exception message
  String message;

  @override
  String toString() => '$runtimeType: $message';
}
