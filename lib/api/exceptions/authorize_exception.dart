import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Authorize exception class
class AuthorizeException extends AccountException {
  /// Initializes
  AuthorizeException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
