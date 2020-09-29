import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Trading exception
class TradingException extends CommonException {
  /// Initializes
  TradingException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
