import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Authorize exception class
class AuthorizeException implements APIBaseException {
  @override
  String get message =>
      '${AuthorizeException().runtimeType} Exception: $message';
}
