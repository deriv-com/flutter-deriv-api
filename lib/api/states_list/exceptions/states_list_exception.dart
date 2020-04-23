import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception for state list call
class StatesListException extends APIBaseException {
  /// Initializes
  StatesListException({String message}) : super(message: message);
}
