import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Exception for portfolio
class PortfolioException extends AccountException {
  /// Initializes
  PortfolioException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
