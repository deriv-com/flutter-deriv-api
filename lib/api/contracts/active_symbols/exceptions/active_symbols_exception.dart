import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception for active symbols request call
class ActiveSymbolsException extends APIBaseException {
  /// Initializes
  ActiveSymbolsException({String message}) : super(message: message);
}
