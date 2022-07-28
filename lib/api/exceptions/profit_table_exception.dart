import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Profit table exception
class ProfitTableException extends AccountException {
  /// Initializes
  ProfitTableException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
