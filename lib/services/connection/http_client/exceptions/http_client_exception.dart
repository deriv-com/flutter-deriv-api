/// HTTP Client Exception exception class.
class HTTPClientException implements Exception {
  /// Initializes http exception.
  HTTPClientException({
    required this.statusCode,
    required this.message,
    required this.errorCode,
  });

  /// Exception message.
  final String message;

  /// Http status code.
  final int statusCode;

  /// Http error code.
  final String? errorCode;

  @override
  String toString() => '$statusCode HTTP Error Ocurred: $message';
}
