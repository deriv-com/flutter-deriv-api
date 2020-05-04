import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Contract exception class
class ContractException extends APIBaseException {
  /// Class constructor
  ContractException({String message}) : super(message: message);
}
