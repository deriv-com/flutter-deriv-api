import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Statement exception
class StatementException extends AccountException {
  /// Initializes
  StatementException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
