import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Cashier exception
class CashierException extends APIBaseException {
  /// Initializes
  CashierException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
