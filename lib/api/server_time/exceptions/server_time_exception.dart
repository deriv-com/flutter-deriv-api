import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Server time exception
class ServerTimeException extends APIBaseException {
  /// Initializes
  ServerTimeException({String message}) : super(message: message);
}
