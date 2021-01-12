import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'user_exception.dart';

/// Transfer exception
class TransferException extends UserException {
  /// Initializes
  TransferException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
