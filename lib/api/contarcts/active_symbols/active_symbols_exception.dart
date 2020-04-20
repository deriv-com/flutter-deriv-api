import 'package:flutter_deriv_api/api/basic_exception.dart';

/// Exception for active symbols request call
class ActiveSymbolsException extends BaseException {
  /// Initializes
  ActiveSymbolsException({String message}) : super(message: message);

  @override
  String get message =>
      '${ActiveSymbolsException().runtimeType} Exception: $message';
}
