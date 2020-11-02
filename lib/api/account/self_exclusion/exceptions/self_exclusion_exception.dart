import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Self exclusion exception
class SelfExclusionException extends AccountException {
  /// Initializes
  SelfExclusionException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}