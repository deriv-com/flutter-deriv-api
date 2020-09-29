import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Reality check exception
class RealityCheckException extends AccountException {
  /// Initializes
  RealityCheckException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
