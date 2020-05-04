import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';

/// Exception for price proposal request calls
class ContractOperationException extends ContractException {
  /// Initializes
  ContractOperationException({String message}) : super(message: message);
}
