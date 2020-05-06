import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Balance exception class
class BalanceException extends AccountException {
  /// Initializes
  BalanceException({String message}) : super(message: message);
}
