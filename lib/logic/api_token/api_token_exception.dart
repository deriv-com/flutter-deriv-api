import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// Api token exception class
class APITokenException implements BaseException {
  @override
  String get message =>
      '${APITokenException().runtimeType} Exception: $message';
}
