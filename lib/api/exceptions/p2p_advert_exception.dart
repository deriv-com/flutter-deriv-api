import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'p2p_exception.dart';

/// P2P advert exception class
class P2PAdvertException extends P2PException {
  /// Initializes
  P2PAdvertException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
