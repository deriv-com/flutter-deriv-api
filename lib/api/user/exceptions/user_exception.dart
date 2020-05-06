import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// User exception
class UserException extends APIBaseException {
  /// Initializes
  UserException({String message}) : super(message: message);
}
