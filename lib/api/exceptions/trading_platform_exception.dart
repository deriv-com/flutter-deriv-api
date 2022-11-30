import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Trading platform exception class.
class TradingPlatformException extends AccountException {
  /// Initializes [TradingPlatformException].
  TradingPlatformException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
