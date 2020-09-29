import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Balance exception class
class BalanceException extends AccountException {
  /// Initializes
  BalanceException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
