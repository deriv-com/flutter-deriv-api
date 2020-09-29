import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// App exception
class AppException extends APIBaseException {
  /// Initializes
  AppException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
