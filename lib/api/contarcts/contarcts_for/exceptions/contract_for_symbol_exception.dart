import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception for contract for symbol request call
class ContractsForSymbolException extends APIBaseException {
  /// Initializes
  ContractsForSymbolException({String message}) : super(message: message);

  @override
  String get message =>
      '${ContractsForSymbolException().runtimeType} Exception: $message';
}
