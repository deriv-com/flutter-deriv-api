import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// New account exception
class NewAccountException extends AppException {
  /// Initializes
  NewAccountException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
