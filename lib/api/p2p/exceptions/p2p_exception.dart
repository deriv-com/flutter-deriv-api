import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// P2P exception class
class P2PException extends APIBaseException {
  /// Class constructor
  P2PException({String message}) : super(message: message);
}
