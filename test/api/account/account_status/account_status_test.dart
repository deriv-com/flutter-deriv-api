import 'package:flutter_deriv_api/api/response/get_account_status_receive_result.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Account Status Test', () async {
    final GetAccountStatusResponse accountStatus =
        await GetAccountStatusResponse.fetchAccountStatus();

    // expect(accountStatus.getAccountStatus.currencyConfig.length, 1);
    // expect(accountStatus.getAccountStatus.currencyConfig.first.currency, 'USD');
    // expect(accountStatus.getAccountStatus.currencyConfig.first.isDepositSuspended, false);
    // expect(accountStatus.getAccountStatus.currencyConfig.first.isWithdrawalSuspended, false);

    // expect(
    //   accountStatus.getAccountStatus.status.first,
    //   AccountStatusType.financialInformationNotComplete,
    // );
    // expect(
    //   accountStatus.status[1],
    //   AccountStatusType.tradingExperienceNotComplete,
    // );
    expect(accountStatus.getAccountStatus.promptClientToAuthenticate, 0);
    expect(accountStatus.getAccountStatus.riskClassification, 'low');
    expect(
      accountStatus.getAccountStatus.authentication.document.status,
      StatusEnum.none,
    );
    expect(
      accountStatus.getAccountStatus.authentication.identity.status,
      StatusEnum.none,
    );

    // expect(
    //   accountStatus.getAccountStatus.authentication.needsVerification,
    //   isA<List<VerificationType>>(),
    // );
    expect(
        accountStatus.getAccountStatus.authentication.needsVerification.length,
        2);
    expect(
      accountStatus.getAccountStatus.authentication.needsVerification.first,
      'document',
    );
    expect(
      accountStatus.getAccountStatus.authentication.needsVerification.last,
      'identity',
    );
  });
}
