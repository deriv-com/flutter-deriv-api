import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Server time exception
class ServerTimeException extends CommonException {
  /// Initializes
  ServerTimeException({String message}) : super(message: message);
}
