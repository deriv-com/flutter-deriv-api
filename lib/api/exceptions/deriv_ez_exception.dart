import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Api token exception class.
class DerivEZException extends AccountException {
  /// Initializes [DerivEZException].
  DerivEZException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
