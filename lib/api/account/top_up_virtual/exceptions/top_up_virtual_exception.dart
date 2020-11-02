import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Top-Up virtual exception class
class TopUpVirtualException extends AccountException {
  /// Initializes
  TopUpVirtualException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
