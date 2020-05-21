import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// P2P exception
class P2PException extends APIBaseException {
  /// Initializes
  P2PException({String message}) : super(message: message);
}
