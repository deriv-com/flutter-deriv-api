import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Top-Up virtual exception class
class TopUpVirtualException extends APIBaseException {
  /// Class constructor
  TopUpVirtualException({String message}) : super(message: message);
}
