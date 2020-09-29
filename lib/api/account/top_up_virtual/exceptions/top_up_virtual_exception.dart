import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Top-Up virtual exception class
class TopUpVirtualException extends AccountException {
  /// Initializes
  TopUpVirtualException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
