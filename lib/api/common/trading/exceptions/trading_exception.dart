import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Trading exception
class TradingException extends CommonException {
  /// Initializes
  TradingException({String message}) : super(message: message);
}
