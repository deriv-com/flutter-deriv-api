import '../../exceptions/api_base_exception.dart';

/// Balance exception class
class BalanceException extends APIBaseException {
  /// Initializes
  BalanceException({String message}) : super(message: message);
}
