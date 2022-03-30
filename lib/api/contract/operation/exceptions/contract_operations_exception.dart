import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exception for price proposal request calls
class ContractOperationException extends ContractException {
  /// Initializes
  ContractOperationException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
