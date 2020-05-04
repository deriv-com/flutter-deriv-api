import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';

/// App exception
class AppException extends ApplicationException {
  /// Initializes
  AppException({String message}) : super(message: message);
}
