import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exception for residence calls
class ResidenceException extends CommonException {
  /// Initializes
  ResidenceException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
