import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exception class for Tick calls
class TickException extends CommonException {
  /// Initializes
  TickException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
