import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Server time exception
class ServerTimeException extends CommonException {
  /// Initializes
  ServerTimeException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
