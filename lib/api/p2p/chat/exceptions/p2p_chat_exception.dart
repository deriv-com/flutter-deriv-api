import 'package:flutter_deriv_api/api/p2p/exceptions/p2p_exception.dart';

/// P2P chat exception
class P2PChatException extends P2PException {
  /// Initializes
  P2PChatException({String message}) : super(message: message);
}
