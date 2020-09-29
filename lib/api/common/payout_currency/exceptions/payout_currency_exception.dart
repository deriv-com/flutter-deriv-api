import '../../exceptions/common_exception.dart';

/// Payout currency exception class
class PayoutCurrencyException extends CommonException {
  /// Initializes
  PayoutCurrencyException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
