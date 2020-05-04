import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Cashier exception
class CashierException extends APIBaseException {
  /// Initializes
  CashierException({String message}) : super(message: message);
}
