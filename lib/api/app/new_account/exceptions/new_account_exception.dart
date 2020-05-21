import 'package:flutter_deriv_api/api/app/exceptions/app_exception.dart';

/// New account exception
class NewAccountException extends AppException {
  /// Initializes
  NewAccountException({String message}) : super(message: message);
}
