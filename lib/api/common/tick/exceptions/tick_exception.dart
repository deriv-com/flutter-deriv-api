import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception class for Tick calls
class TickException extends CommonException {
  /// Initializes
  TickException({String message}) : super(message: message);
}
