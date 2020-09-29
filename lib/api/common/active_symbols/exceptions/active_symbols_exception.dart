import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception for active symbols request call
class ActiveSymbolsException extends CommonException {
  /// Initializes
  ActiveSymbolsException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
