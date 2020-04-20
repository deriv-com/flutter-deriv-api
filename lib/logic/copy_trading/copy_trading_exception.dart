import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// Exception for CopyTrading
class CopyTradingException extends BaseException {
  @override
  String get message =>
      '${CopyTradingException().runtimeType} Exception: $message';
}
