import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Statement exception
class StatementException extends AccountException {
  /// Initializes
  StatementException({String message}) : super(message: message);
}
