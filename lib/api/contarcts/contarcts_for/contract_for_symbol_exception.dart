import 'package:flutter_deriv_api/api/basic_exception.dart';

/// Exception for contract for symbol request call
class ContractsForSymbolException extends BaseException {
  /// Initializes
  ContractsForSymbolException({String message}) : super(message: message);

  @override
  String get message =>
      '${ContractsForSymbolException().runtimeType} Exception: $message';
}
