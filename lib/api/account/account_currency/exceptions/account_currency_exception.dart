import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Account currency exception class
class AccountCurrencyException extends AccountException {
  /// Initializes
  AccountCurrencyException({String message}) : super(message: message);
}
