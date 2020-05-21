import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception for state call
class StateException extends CommonException {
  /// Initializes
  StateException({String message}) : super(message: message);
}
