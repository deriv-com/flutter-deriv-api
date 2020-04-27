import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/mt5/mt5_withdrawal.dart';

import 'mt5_withdrawal_model_mock_data.dart';

void main() {
  test('mt5 withdrawal json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(mt5WithdrawalModelMockData);
    final MT5Withdrawal mt5Withdrawal = MT5Withdrawal.fromJson(mapData);

    expect(mt5Withdrawal.mt5Withdrawal, true);
    expect(mt5Withdrawal.binaryTransactionId, 486245);
  });
}
