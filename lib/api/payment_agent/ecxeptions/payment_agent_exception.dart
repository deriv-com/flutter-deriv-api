import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Payment agent exception
class PaymentAgentException extends APIBaseException {
  /// Class constructor
  PaymentAgentException({String message}) : super(message: message);
}
