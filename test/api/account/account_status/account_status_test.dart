import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_status/account_status.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Account Status Test', () async {
    final AccountStatus accountStatus =
        await AccountStatus.fetchAccountStatus();

    expect(accountStatus.currencyConfig.length, 1);
    expect(accountStatus.currencyConfig.first.currency, 'USD');
    expect(accountStatus.currencyConfig.first.isDepositSuspended, false);
    expect(accountStatus.currencyConfig.first.isWithdrawalSuspended, false);

    expect(
      accountStatus.status.first,
      AccountStatusType.financialInformationNotComplete,
    );
    expect(
      accountStatus.status[1],
      AccountStatusType.tradingExperienceNotComplete,
    );
    expect(accountStatus.promptClientToAuthenticate, false);
    expect(accountStatus.riskClassification, AccountRiskClassification.low);
    expect(
      accountStatus.authentication.document.status,
      AccountIdentityStatus.none,
    );
    expect(
      accountStatus.authentication.identity.status,
      AccountIdentityStatus.none,
    );

    expect(accountStatus.authentication.needsVerification.length, 2);
    expect(accountStatus.authentication.needsVerification.first, 'document');
    expect(accountStatus.authentication.needsVerification.last, 'identity');
  });
}
