import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// App get exception class
class AppGetException implements BaseException {
  @override
  String get message => '${AppGetException().runtimeType} Exception: $message';
}
