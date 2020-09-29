import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// MT5 exception class
class MT5Exception extends APIBaseException {
  /// Initializes
  MT5Exception({
    String code,
    String message,
  }) : super(code: code, message: message);
}
