import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Account limits exception class
class AccountLimitsException extends AccountException {
  /// Initializes
  AccountLimitsException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
