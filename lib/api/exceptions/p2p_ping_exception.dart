import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'common_exception.dart';

/// P2P Ping exception class
class P2pPingException extends CommonException {
  /// Initializes
  P2pPingException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
