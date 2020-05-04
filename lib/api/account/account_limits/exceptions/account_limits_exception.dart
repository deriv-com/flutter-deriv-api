import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Account limits exception class
class AccountLimitsException extends APIBaseException {
  /// Initializes
  AccountLimitsException({String message}) : super(message: message);
}
