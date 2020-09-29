import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';

/// Exceptions for transaction call
class TransactionsException extends ContractException {
  /// Initializes
  TransactionsException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
