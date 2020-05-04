import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Transfer exception
class TransferException extends APIBaseException {
  /// Initializes
  TransferException({String message}) : super(message: message);
}
