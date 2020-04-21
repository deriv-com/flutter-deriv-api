import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// App exception class
class AppException implements APIBaseException {
  @override
  String get message => '${AppException().runtimeType} Exception: $message';
}
