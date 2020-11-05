import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Exceptions for transaction call
class TransactionsException extends ContractException {
  /// Initializes
  TransactionsException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
