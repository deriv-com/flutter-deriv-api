import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// MT5 exception class
class MT5Exception extends APIBaseException {
  /// Class constructor
  MT5Exception({String message}) : super(message: message);
}
