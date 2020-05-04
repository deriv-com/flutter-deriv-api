import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception for price proposal request calls
class ContractOperationException extends APIBaseException {
  /// Initializes
  ContractOperationException({String message}) : super(message: message);
}
