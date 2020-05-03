import '../../exceptions/api_base_exception.dart';

/// Exception class for account status calls
class AccountStatusException extends APIBaseException {
  /// Initializes
  AccountStatusException({String message}) : super(message: message);
}
