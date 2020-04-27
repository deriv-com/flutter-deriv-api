import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Self exclusion exception
class SelfExclusionException extends APIBaseException {
  /// Class constructor
  SelfExclusionException({String message}) : super(message: message);
}
