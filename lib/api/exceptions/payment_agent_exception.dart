import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

import 'common_exception.dart';

/// Payment agent exception
class PaymentAgentException extends CommonException {
  /// Initializes
  PaymentAgentException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
