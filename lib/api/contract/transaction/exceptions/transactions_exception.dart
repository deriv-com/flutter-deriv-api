import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exceptions for transaction call
class TransactionsException extends APIBaseException {
  /// Initializes
  TransactionsException({String message}) : super(message: message);
}
