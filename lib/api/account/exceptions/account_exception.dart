import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Account exception
class AccountException extends APIBaseException {
  /// Initializes
  AccountException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
