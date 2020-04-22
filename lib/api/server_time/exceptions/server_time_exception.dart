import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Server time exception
class ServerTimeException extends APIBaseException {
  /// Class constructor
  ServerTimeException({String message}) : super(message: message);
}
