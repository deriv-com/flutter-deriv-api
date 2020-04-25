/// Base exception class
class APIBaseException implements Exception {
  /// Class constructor
  APIBaseException({this.message});

  /// Exception message
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}
