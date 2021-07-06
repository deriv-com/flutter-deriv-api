import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'app_exception.dart';

/// New account exception
class NewAccountException extends AppException {
  /// Initializes
  NewAccountException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
