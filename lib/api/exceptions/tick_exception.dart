import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'common_exception.dart';

/// Exception class for Tick calls
class TickException extends CommonException {
  /// Initializes
  TickException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
