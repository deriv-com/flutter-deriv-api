import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Reality check exception
class RealityCheckException extends AccountException {
  /// Initializes
  RealityCheckException({String message}) : super(message: message);
}
