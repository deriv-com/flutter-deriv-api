import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Common exception
class CommonException extends APIBaseException {
  /// Initializes
  CommonException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}