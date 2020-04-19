import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// Authorize exception class
class AuthorizeException implements BaseException {
  @override
  String get message =>
      '${AuthorizeException().runtimeType} Exception: $message';
}
