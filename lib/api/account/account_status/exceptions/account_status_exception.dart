import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Exception class for account status calls
class AccountStatusException extends AccountException {
  /// Initializes
  AccountStatusException({String message}) : super(message: message);
}
