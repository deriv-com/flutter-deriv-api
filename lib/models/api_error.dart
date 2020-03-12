/// A class for api errors
class APIError {
  /// Class constructor
  APIError({this.code, this.message});

  /// Extract class information from a map object
  APIError.fromMap(Map<String, dynamic> error)
      : code = error['code'],
        message = error['message'];

  /// Error code
  final String code;

  /// Error message
  final String message;

  @override
  String toString() => 'APIError(code: $code, message: $message)';
}
