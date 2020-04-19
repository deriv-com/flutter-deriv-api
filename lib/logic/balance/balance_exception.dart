import 'package:flutter_deriv_api/logic/exceptions/base_exception.dart';

/// Balance exception class
class BalanceException implements BaseException {
  @override
  String get message => '${BalanceException().runtimeType} Exception: $message';
}
