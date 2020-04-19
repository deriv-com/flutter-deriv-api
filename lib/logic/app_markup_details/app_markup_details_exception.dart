import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// App get exception class
class AppMarkupDetailsException implements BaseException {
  @override
  String get message =>
      '${AppMarkupDetailsException().runtimeType} Exception: $message';
}
