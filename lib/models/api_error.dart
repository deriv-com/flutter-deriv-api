/// A class for api errors
class ApiErrorModel {
  /// Class constructor
  ApiErrorModel({this.code, this.message});

  /// Extract class from a map object
  ApiErrorModel.fromMap(Map<String, dynamic> error)
      : code = error['code'],
        message = error['message'];

  /// Error code
  final String code;

  /// Error message
  final String message;

  @override
  String toString() => 'APIError(code: $code, message: $message)';
}
