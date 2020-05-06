import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Application exception
class ApplicationException extends APIBaseException {
  /// Initializes
  ApplicationException({String message}) : super(message: message);
}
