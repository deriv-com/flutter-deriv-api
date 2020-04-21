import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/logic/mt5/mt5_deposit.dart';

import 'mt5_deposit_model_mock_data.dart';

void main() {
  test('mt5 deposit json parsing', () async {
    final Map<String, dynamic> map = jsonDecode(json);
    final MT5Deposit mt5Deposit = MT5Deposit.fromJson(map);

    expect(mt5Deposit.mt5Deposit, 1234);
    expect(mt5Deposit.mt5Deposit, 123);
  });
}
