import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Account settings exception class
class AccountSettingsException extends AccountException {
  /// Initializes
  AccountSettingsException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
