import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Account exception class
class AccountException extends APIBaseException {
  /// Class constructor
  AccountException({String message}) : super(message: message);
}
