import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Top-Up virtual exception class
class TopUpVirtualException extends AccountException {
  /// Initializes
  TopUpVirtualException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
