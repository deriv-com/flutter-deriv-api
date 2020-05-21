import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Exception for CopyTrading
class CopyTradingException extends AccountException {
  /// Initializes
  CopyTradingException({String message}) : super(message: message);
}
