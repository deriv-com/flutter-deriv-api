import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Self exclusion exception
class SelfExclusionException extends AccountException {
  /// Initializes
  SelfExclusionException({String message}) : super(message: message);
}
