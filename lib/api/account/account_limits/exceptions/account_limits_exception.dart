import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Account limits exception class
class AccountLimitsException extends AccountException {
  /// Initializes
  AccountLimitsException({String message}) : super(message: message);
}
