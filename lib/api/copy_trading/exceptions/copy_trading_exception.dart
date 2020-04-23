import '../../exceptions/api_base_exception.dart';

/// Exception for CopyTrading
class CopyTradingException extends APIBaseException {
  @override
  String get message =>
      '${CopyTradingException().runtimeType} Exception: $message';
}
