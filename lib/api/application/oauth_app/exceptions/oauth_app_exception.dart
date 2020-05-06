import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';

/// Oauth app exception
class OauthAppException extends ApplicationException {
  /// Initializes
  OauthAppException({String message}) : super(message: message);
}
