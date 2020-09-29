import 'package:flutter_deriv_api/api/p2p/exceptions/p2p_exception.dart';

/// P2P advert exception class
class P2PAdvertException extends P2PException {
  /// Initializes
  P2PAdvertException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
