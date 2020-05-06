import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Login exception class
class LoginException extends AccountException {
  /// Initializes
  LoginException({String message}) : super(message: message);
}
