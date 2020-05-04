import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exchange exception class
class ExchangeException extends APIBaseException {
  /// Initializes
  ExchangeException({String message}) : super(message: message);
}
