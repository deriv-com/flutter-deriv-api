import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'common_exception.dart';

/// Exception for residence calls
class ResidenceException extends CommonException {
  /// Initializes
  ResidenceException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
