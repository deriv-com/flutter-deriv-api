import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Api token exception class
class APITokenException extends AccountException {
  /// Initializes
  APITokenException({String message}) : super(message: message);
}
