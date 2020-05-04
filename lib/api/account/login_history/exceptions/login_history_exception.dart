import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Login history exception class
class LoginHistoryException extends APIBaseException {
  /// Initializes
  LoginHistoryException({String message}) : super(message: message);
}
