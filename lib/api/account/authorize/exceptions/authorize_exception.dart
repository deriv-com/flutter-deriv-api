import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Authorize exception class
class AuthorizeException extends AccountException {
  /// Initializes
  AuthorizeException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
