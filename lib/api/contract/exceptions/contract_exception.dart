import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Contract exception class
class ContractException extends APIBaseException {
  /// Initializes
  ContractException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
