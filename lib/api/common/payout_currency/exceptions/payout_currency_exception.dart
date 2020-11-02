import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import '../../exceptions/common_exception.dart';

/// Payout currency exception class
class PayoutCurrencyException extends CommonException {
  /// Initializes
  PayoutCurrencyException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}