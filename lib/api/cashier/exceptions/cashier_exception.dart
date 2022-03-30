import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Cashier exception
class CashierException extends APIBaseException {
  /// Initializes
  CashierException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
