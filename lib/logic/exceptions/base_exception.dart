/// Abstraction exception class
class BaseException implements Exception {
  /// Class constructor
  BaseException({
    this.message,
  });

  /// Exception message
  final String message;

  @override
  String toString() => '${BaseException().runtimeType} Exception: $message';
}
