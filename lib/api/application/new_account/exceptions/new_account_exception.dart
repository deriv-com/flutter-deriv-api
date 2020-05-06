import 'package:flutter_deriv_api/api/application/exceptions/application_exception.dart';

/// New account exception
class NewAccountException extends ApplicationException {
  /// Initializes
  NewAccountException({String message}) : super(message: message);
}
