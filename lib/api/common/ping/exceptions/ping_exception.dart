import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Ping exception class
class PingException extends CommonException {
  /// Initializes
  PingException({String message}) : super(message: message);
}
