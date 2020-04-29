import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exchange exception class
class ExchangeException extends APIBaseException {
  /// Class constructor
  ExchangeException({String message}) : super(message: message);
}
