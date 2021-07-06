import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'p2p_exception.dart';

/// P2P advertiser exception class
class P2PAdvertiserException extends P2PException {
  /// Initializes
  P2PAdvertiserException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
