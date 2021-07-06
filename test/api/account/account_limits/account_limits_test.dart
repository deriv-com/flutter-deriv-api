import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/get_limits_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Account Limits Test', () async {
    final GetLimitsResponse accountLimits =
        await GetLimitsResponse.fetchAccountLimits();

    expect(accountLimits.getLimits.accountBalance, 300000.0);
    expect(accountLimits.getLimits.lifetimeLimit, 10000.0);
    expect(accountLimits.getLimits.numOfDays, 30);
    expect(accountLimits.getLimits.numOfDaysLimit, 10000.0);
    expect(accountLimits.getLimits.openPositions, 100);
    expect(accountLimits.getLimits.payout, 50000.0);
    expect(accountLimits.getLimits.withdrawalForXDaysMonetary, 0.0);
    expect(accountLimits.getLimits.withdrawalSinceInceptionMonetary, 0.0);

    final MarketSpecificPropertyItem firstCommoditiesLimit =
        accountLimits.getLimits.marketSpecific.entries.first.value.first;

    expect(firstCommoditiesLimit.name, 'Commodities');
    expect(firstCommoditiesLimit.payoutLimit, 5000.0);
    expect(firstCommoditiesLimit.profileName, 'moderate_risk');
    expect(firstCommoditiesLimit.turnoverLimit, 50000.0);
  });
}
