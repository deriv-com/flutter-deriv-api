import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception class for Landing company
class LandingCompanyException extends CommonException {
  /// Initializes
  LandingCompanyException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
