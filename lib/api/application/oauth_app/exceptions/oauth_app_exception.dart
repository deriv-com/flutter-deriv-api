import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Oauth app exception
class OauthAppException extends APIBaseException {
  /// Initializes
  OauthAppException({String message}) : super(message: message);
}
