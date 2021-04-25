import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/user/models/transfer_account_model.dart';
import 'package:flutter_deriv_api/api/user/transfer/transfer_between_accounts.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Transfer Between Accounts Test', () async {
    final TransferBetweenAccounts transferBetweenAccounts =
        await TransferBetweenAccounts.transfer(
      const TransferBetweenAccountsRequest(
        accountFrom: 'MLT100',
        accountTo: 'MF100',
        amount: 100,
        currency: 'EUR',
        transferBetweenAccounts: 0,
      ),
    );

    expect(transferBetweenAccounts.transferBetweenAccounts, true);

    expect(transferBetweenAccounts.accounts.length, 1);

    final TransferAccountModel account = transferBetweenAccounts.accounts[0];

    expect(account.accountType, TransferAccountType.mt5);
    expect(account.balance, '120.0');
    expect(account.currency, 'EUR');
    expect(account.loginId, 'MLT100');
    expect(account.mt5Group, 'real_vanuatu_standard');

    expect(transferBetweenAccounts.clientToFullName, 'John Doe');
    expect(transferBetweenAccounts.clientToLoginId, 'MF100');
    expect(transferBetweenAccounts.transactionId, 34625723);
  });
}
