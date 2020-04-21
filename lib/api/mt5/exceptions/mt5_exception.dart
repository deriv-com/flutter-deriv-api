import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// MT5 exception class
class MT5Exception implements APIBaseException {
  @override
  String get message => '${MT5Exception().runtimeType} Exception: $message';
}
