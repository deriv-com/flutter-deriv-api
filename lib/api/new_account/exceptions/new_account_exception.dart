import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// New account exception
class NewAccountException extends APIBaseException {
  /// Class constructor
  NewAccountException({String message}) : super(message: message);
}
