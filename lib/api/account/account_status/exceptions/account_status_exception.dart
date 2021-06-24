import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exception class for account status calls
class AccountStatusException extends AccountException {
  /// Initializes
  AccountStatusException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
