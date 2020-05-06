import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Account exception
class AccountException extends APIBaseException {
  /// Initializes
  AccountException({String message}) : super(message: message);
}
