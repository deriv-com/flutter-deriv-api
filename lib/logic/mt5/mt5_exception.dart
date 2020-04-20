import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// MT5 exception class
class MT5Exception implements BaseException {
  @override
  String get message => '${MT5Exception().runtimeType} Exception: $message';
}
