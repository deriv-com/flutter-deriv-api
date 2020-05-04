import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Reality check exception
class RealityCheckException extends APIBaseException {
  /// Initializes
  RealityCheckException({String message}) : super(message: message);
}
