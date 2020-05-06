import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Authorize exception class
class AuthorizeException extends AccountException {
  /// Initializes
  AuthorizeException({String message}) : super(message: message);
}
