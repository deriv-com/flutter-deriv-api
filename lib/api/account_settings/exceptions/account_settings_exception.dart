import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Account settings exception class
class AccountSettingsException extends APIBaseException {
  /// Class constructor
  AccountSettingsException({String message}) : super(message: message);
}
