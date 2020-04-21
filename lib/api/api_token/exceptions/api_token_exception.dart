import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Api token exception class
class APITokenException implements APIBaseException {
  @override
  String get message =>
      '${APITokenException().runtimeType} Exception: $message';
}
