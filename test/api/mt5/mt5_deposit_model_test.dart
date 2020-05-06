import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/mt5/mt5_deposit.dart';

import 'mt5_deposit_model_mock_data.dart';

void main() {
  test('mt5 deposit JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(mt5DepositModelMockData);
    final MT5Deposit mt5Account = MT5Deposit.fromJson(mapData);

    expect(mt5Account.mt5Deposit, true);
    expect(mt5Account.binaryTransactionId, 3487342);
  });
}
