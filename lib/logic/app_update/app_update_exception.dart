import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// App update exception class
class AppUpdateException implements BaseException {
  @override
  String get message =>
      '${AppUpdateException().runtimeType} Exception: $message';
}
