import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exception for contract for symbol request call
class ContractsForSymbolException extends ContractException {
  /// Initializes
  ContractsForSymbolException({
    BaseExceptionModel? baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
