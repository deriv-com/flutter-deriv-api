/// HTTP Client Exception exception class.
class HTTPClientException implements Exception {
  /// Initializes http exception.
  HTTPClientException({
    required this.statusCode,
    required this.message,
  });

  /// Exception message.
  final String message;

  /// Http status code.
  final int statusCode;

  @override
  String toString() => '$statusCode HTTP Error Ocurred: $message';
}
