import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Payment agent exception
class PaymentAgentException extends AccountException {
  /// Initializes
  PaymentAgentException({String message}) : super(message: message);
}
