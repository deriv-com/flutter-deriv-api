import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/mt5/mt5_account.dart';

import 'mt5_account_model_mock_data.dart';

void main() {
  test('mt5 account JSON parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(mt5AccountModelMockData);
    final MT5Account mt5Account =
        MT5Account.fromJson(mapData['mt5_login_list'][0]);

    expect(mt5Account.accountType, AccountType.gaming);
    expect(mt5Account.balance, 350.0);
    expect(mt5Account.country, 'India');
    expect(mt5Account.currency, 'USD');
    expect(mt5Account.displayBalance, '350.0');
    expect(mt5Account.email, 'test@example.com');
    expect(mt5Account.group, 'svg_standard');
    expect(mt5Account.leverage, 100);
    expect(mt5Account.login, 'MT346525');
    expect(mt5Account.login, 'MT346525');
    expect(mt5Account.mt5AccountType, MT5AccountType.advanced);
    expect(mt5Account.name, 'Jon Doe');
  });
}
