import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// App logic exception class
class AppException implements BaseException {
  @override
  String get message => '${AppException().runtimeType} Exception: $message';
}
