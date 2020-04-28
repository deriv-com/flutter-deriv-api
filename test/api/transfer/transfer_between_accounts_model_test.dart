import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/models/transfer_account_model.dart';
import 'package:flutter_deriv_api/api/transfer/transfer_between_accounts.dart';

import 'transfer_between_accounts_model_mock_data.dart';

void main() {
  test('app update json parsing', () {
    final Map<String, dynamic> mapData =
        jsonDecode(transferBetweenAccountsMockData);
    final TransferBetweenAccounts transferBetweenAccounts =
        TransferBetweenAccounts.fromJson(mapData);

    expect(transferBetweenAccounts.transferBetweenAccounts, true);

    expect(transferBetweenAccounts.accounts.length, 1);

    final TransferAccountModel account = transferBetweenAccounts.accounts[0];

    expect(account.accountType, TransferAccountType.mt5);
    expect(account.balance, '120.0');
    expect(account.currency, 'EUR');
    expect(account.loginId, 'CR000000');
    expect(account.mt5Group, 'real_vanuatu_standard');

    expect(transferBetweenAccounts.clientToFullName, 'John Doe');
    expect(transferBetweenAccounts.clientToLoginId, 'CR000001');
    expect(transferBetweenAccounts.transactionId, 34625723);
  });
}
