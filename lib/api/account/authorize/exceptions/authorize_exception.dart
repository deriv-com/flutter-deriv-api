import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Authorize exception class
class AuthorizeException extends AccountException {
  /// Initializes
  AuthorizeException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
