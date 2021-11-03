import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/get_account_status_response_result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Account Status Test', () async {
    final GetAccountStatusResponse accountStatus =
        await GetAccountStatusResponse.fetchAccountStatus();

    expect(accountStatus.getAccountStatus?.currencyConfig.length, 1);
    expect(accountStatus.getAccountStatus?.currencyConfig.keys.first, 'USD');
    expect(
        accountStatus
            .getAccountStatus?.currencyConfig.values.first.isDepositSuspended,
        false);
    expect(
        accountStatus.getAccountStatus?.currencyConfig.values.first
            .isWithdrawalSuspended,
        false);

    // expect(
    //   accountStatus.getAccountStatus.status.first,
    //   AccountStatusType.financialInformationNotComplete,
    // );
    // expect(
    //   accountStatus.status[1],
    //   AccountStatusType.tradingExperienceNotComplete,
    // );
    expect(accountStatus.getAccountStatus?.promptClientToAuthenticate, false);
    expect(accountStatus.getAccountStatus?.riskClassification, 'low');
    expect(
      accountStatus.getAccountStatus?.authentication?.document?.status,
      DocumentStatusEnum.pending,
    );
    expect(
      accountStatus.getAccountStatus?.authentication?.identity?.status,
      DocumentStatusEnum.pending,
    );

    // expect(
    //   accountStatus.getAccountStatus.authentication.needsVerification,
    //   isA<List<VerificationType>>(),
    // );
    expect(
        accountStatus
            .getAccountStatus?.authentication?.needsVerification.length,
        0);
  });
}
