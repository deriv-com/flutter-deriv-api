import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Top-Up virtual exception class
class TopUpVirtualException extends AccountException {
  /// Initializes
  TopUpVirtualException({String message}) : super(message: message);
}
