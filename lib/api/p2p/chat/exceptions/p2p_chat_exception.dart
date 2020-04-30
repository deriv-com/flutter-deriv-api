import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// P2P chat exception
class P2PChatException extends APIBaseException {
  /// Class constructor
  P2PChatException({String message}) : super(message: message);
}
