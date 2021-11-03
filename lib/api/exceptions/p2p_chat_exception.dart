import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'p2p_exception.dart';

/// P2P chat exception
class P2PChatException extends P2PException {
  /// Initializes
  P2PChatException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
