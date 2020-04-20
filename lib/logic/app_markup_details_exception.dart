import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// Forget exception class
class ForgetException implements BaseException {
  @override
  String get message => '${ForgetException().runtimeType} Exception: $message';
}
