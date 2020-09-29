import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception for residence calls
class ResidenceException extends CommonException {
  /// Initializes
  ResidenceException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
