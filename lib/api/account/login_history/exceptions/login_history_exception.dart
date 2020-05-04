import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Login history exception class
class LoginHistoryException extends AccountException {
  /// Initializes
  LoginHistoryException({String message}) : super(message: message);
}
