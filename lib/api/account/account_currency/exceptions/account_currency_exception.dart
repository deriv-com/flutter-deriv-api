import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Account currency exception class
class AccountCurrencyException extends AccountException {
  /// Initializes
  AccountCurrencyException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
