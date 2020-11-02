import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exchange exception class
class ExchangeException extends CommonException {
  /// Initializes
  ExchangeException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}