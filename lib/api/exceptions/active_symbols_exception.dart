import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'common_exception.dart';

/// Exception for active symbols request call
class ActiveSymbolsException extends CommonException {
  /// Initializes
  ActiveSymbolsException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
