import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Forget exception class
class ForgetException extends CommonException {
  /// Initializes
  ForgetException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
