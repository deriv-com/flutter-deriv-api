import '../../exceptions/api_base_exception.dart';

/// Exception for CopyTrading
class CopyTradingException extends APIBaseException {
  /// Initializes
  CopyTradingException({String message}) : super(message: message);
}
