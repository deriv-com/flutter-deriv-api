import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';

/// Exception for contract for symbol request call
class ContractsForSymbolException extends ContractException {
  /// Initializes
  ContractsForSymbolException({String message}) : super(message: message);
}
