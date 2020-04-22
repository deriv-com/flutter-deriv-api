import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Authorize exception class
class AuthorizeException extends APIBaseException {
  /// Class constructor
  AuthorizeException({String message}) : super(message: message);
}
