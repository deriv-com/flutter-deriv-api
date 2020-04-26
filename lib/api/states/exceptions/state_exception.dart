import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception for state call
class StateException extends APIBaseException {
  /// Initializes
  StateException({String message}) : super(message: message);
}
