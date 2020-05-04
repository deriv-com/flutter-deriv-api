import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Common exception
class CommonException extends APIBaseException {
  /// Initializes
  CommonException({String message}) : super(message: message);
}
