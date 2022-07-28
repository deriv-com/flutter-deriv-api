import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Exception for CopyTrading
class CopyTradingException extends AccountException {
  /// Initializes
  CopyTradingException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
