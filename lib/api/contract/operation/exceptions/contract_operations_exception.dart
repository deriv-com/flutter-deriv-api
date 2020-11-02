import 'package:flutter_deriv_api/api/contract/exceptions/contract_exception.dart';

/// Exception for price proposal request calls
class ContractOperationException extends ContractException {
  /// Initializes
  ContractOperationException({
    String code,
    String message,
    this.field,
  }) : super(code: code, message: message);

  /// An extra detail added to error message that indicates which field -
  /// usually in UI - is affected by the reported error.
  String field;
}
