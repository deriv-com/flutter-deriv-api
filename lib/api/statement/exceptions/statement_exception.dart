import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Statement exception
class StatementException extends APIBaseException {
  /// Initializes
  StatementException({String message}) : super(message: message);
}
