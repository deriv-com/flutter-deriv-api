import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'account_exception.dart';

/// Account currency exception class
class AccountCurrencyException extends AccountException {
  /// Initializes
  AccountCurrencyException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
