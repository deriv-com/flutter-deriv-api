import 'dart:convert';
import 'package:flutter_deriv_api/logic/balance/balance.dart';
import 'package:flutter_test/flutter_test.dart';

import 'balance_mock_data.dart';

void main() {
  test('Balance JSON serialization', () {
    final Map<String, dynamic> balanceMap = jsonDecode(balanceJSON);
    final Balance balance = Balance.fromJson(balanceMap['balance']);

    expect(balance.balance, 9650.74);
    expect(balance.currency, 'USD');
    expect(balance.id, '811e7ac4-1454-b909-6adb-904a2e9cb374');
    expect(balance.loginid, 'VRTC2351953');
  });
}