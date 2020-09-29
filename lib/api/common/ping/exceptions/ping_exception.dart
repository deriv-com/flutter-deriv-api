import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Ping exception class
class PingException extends CommonException {
  /// Initializes
  PingException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
