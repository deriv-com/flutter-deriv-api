import 'package:flutter_deriv_api/api/user/exceptions/user_exception.dart';

/// Transfer exception
class TransferException extends UserException {
  /// Initializes
  TransferException({String message}) : super(message: message);
}
