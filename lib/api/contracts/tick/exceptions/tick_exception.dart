import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception class for Tick calls
class TickException extends APIBaseException {
  /// Initializes
  TickException({String message}) : super(message: message);
}
