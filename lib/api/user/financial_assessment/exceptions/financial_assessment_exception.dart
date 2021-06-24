import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';

/// Financial assessment exception class
class FinancialAssessmentException extends UserException {
  /// Initializes
  FinancialAssessmentException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
