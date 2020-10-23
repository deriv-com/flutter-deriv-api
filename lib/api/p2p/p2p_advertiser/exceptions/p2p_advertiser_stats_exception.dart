import 'package:flutter_deriv_api/api/p2p/exceptions/p2p_exception.dart';

/// P2P advertiser stats exception class
class P2PAdvertiserStatsException extends P2PException {
  /// Initializes
  P2PAdvertiserStatsException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
