import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception for CopyTrading
class CopyTradingException extends CommonException {
  /// Initializes
  CopyTradingException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
