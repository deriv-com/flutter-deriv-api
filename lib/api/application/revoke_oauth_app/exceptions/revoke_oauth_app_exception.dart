import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';

/// Revoke oauth app exception
class RevokeOauthAppException extends ApplicationException {
  /// Initializes
  RevokeOauthAppException({String message}) : super(message: message);
}
