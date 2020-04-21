import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/logic/mt5/mt5_account.dart';

import 'mt5_account_model_mock_data.dart';

void main() {
  test('mt5 account json parsing', () async {
    final Map<String, dynamic> map = jsonDecode(json);
    final MT5Account mt5Deposit = MT5Account.fromJson(map);

    expect(mt5Deposit.accountType, 'demo');
    expect(mt5Deposit.balance, 10000);
    expect(mt5Deposit.currency, 'EUR');
    expect(mt5Deposit.displayBalance, '10000.00');
    expect(mt5Deposit.login, 'MTD1266159');
    expect(mt5Deposit.accountType, 'standard');
  });
}
