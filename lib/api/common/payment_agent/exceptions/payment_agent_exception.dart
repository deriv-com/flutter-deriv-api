import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Payment agent exception
class PaymentAgentException extends CommonException {
  /// Initializes
  PaymentAgentException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
