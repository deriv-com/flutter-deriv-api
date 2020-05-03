import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Api token exception class
class APITokenException extends APIBaseException {
  /// Initializes
  APITokenException({String message}) : super(message: message);
}
