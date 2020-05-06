import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Contract exception class
class ContractException extends APIBaseException {
  /// Initializes
  ContractException({String message}) : super(message: message);
}
