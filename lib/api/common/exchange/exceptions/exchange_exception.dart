import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exchange exception class
class ExchangeException extends CommonException {
  /// Initializes
  ExchangeException({String message}) : super(message: message);
}
