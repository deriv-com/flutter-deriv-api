import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';

/// Financial assessment exception class
class FinancialAssessmentException extends UserException {
  /// Initializes
  FinancialAssessmentException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
