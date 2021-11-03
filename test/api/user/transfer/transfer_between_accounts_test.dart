import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/transfer_between_accounts_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/transfer_between_accounts_send.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Transfer Between Accounts Test', () async {
    final TransferBetweenAccountsResponse transferBetweenAccounts =
        await TransferBetweenAccountsResponse.transfer(
      const TransferBetweenAccountsRequest(
        accountFrom: 'MLT100',
        accountTo: 'MF100',
        amount: 100,
        currency: 'EUR',
        transferBetweenAccounts: null,
      ),
    );

    expect(transferBetweenAccounts.transferBetweenAccounts, true);

    expect(transferBetweenAccounts.accounts!.length, 1);

    final AccountsItem account = transferBetweenAccounts.accounts!.first;

    expect(account.accountType, AccountTypeEnum.mt5);
    expect(account.balance, '120.0');
    expect(account.currency, 'EUR');
    expect(account.loginid, 'MLT100');
    expect(account.mt5Group, 'real_vanuatu_standard');

    expect(transferBetweenAccounts.clientToFullName, 'John Doe');
    expect(transferBetweenAccounts.clientToLoginid, 'MF100');
    expect(transferBetweenAccounts.transactionId, 34625723);
  });
}
