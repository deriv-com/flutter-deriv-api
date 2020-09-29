import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';

/// New account exception
class NewAccountException extends AppException {
  /// Initializes
  NewAccountException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
