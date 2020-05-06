import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Transfer exception
class TransferException extends AccountException {
  /// Initializes
  TransferException({String message}) : super(message: message);
}
