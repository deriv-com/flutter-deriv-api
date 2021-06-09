import 'package:flutter_deriv_api/api/account/models/account_authentication_status_model.dart';
import 'package:flutter_deriv_api/api/account/models/account_status_currency_config_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_status/account_status.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Account Status Test', () async {
    final AccountStatus accountStatus =
        await AccountStatus.fetchAccountStatus();

    final List<AccountStatusCurrencyConfigModel?> currencyConfigs =
        accountStatus.currencyConfig!;
    final AccountStatusCurrencyConfigModel exampleCurrencyConfig =
        currencyConfigs.first!;
    final List<AccountStatusType?> statusTypes = accountStatus.status!;
    final AccountAuthenticationStatusModel authenticationStatus =
        accountStatus.authentication!;

    expect(currencyConfigs.length, 1);
    expect(exampleCurrencyConfig.currency, 'USD');
    expect(exampleCurrencyConfig.isDepositSuspended, false);
    expect(exampleCurrencyConfig.isWithdrawalSuspended, false);

    expect(
      statusTypes.first,
      AccountStatusType.financialInformationNotComplete,
    );
    expect(
      statusTypes[1],
      AccountStatusType.tradingExperienceNotComplete,
    );
    expect(accountStatus.promptClientToAuthenticate, false);
    expect(accountStatus.riskClassification, AccountRiskClassification.low);
    expect(
      authenticationStatus.document!.status,
      AccountIdentityStatus.none,
    );
    expect(
      authenticationStatus.identity!.status,
      AccountIdentityStatus.none,
    );

    expect(
      authenticationStatus.needsVerification,
      isA<List<VerificationType?>?>(),
    );
    expect(authenticationStatus.needsVerification!.length, 2);
    expect(
      authenticationStatus.needsVerification!.first,
      VerificationType.document,
    );
    expect(
      authenticationStatus.needsVerification!.last,
      VerificationType.identity,
    );
  });
}
