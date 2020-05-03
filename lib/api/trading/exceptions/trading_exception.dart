import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Trading exception
class TradingException extends APIBaseException {
  /// Initializes
  TradingException({String message}) : super(message: message);
}
