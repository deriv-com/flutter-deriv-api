import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_limits/account_limits.dart';
import 'package:flutter_deriv_api/api/account/models/market_limit_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Account Limits Test', () async {
    final AccountLimits accountLimits =
        await AccountLimits.fetchAccountLimits();

    expect(accountLimits.accountBalance, 300000.0);
    expect(accountLimits.lifetimeLimit, 10000.0);
    expect(accountLimits.numOfDays, 30);
    expect(accountLimits.numOfDaysLimit, 10000.0);
    expect(accountLimits.openPositions, 100);
    expect(accountLimits.payout, 50000.0);
    expect(accountLimits.withdrawalForXDaysMonetary, 0.0);
    expect(accountLimits.withdrawalSinceInceptionMonetary, 0.0);

    final List<MarketLimitModel> commoditiesLimits =
        accountLimits.marketSpecific.first.marketLimits;

    expect(commoditiesLimits.first.name, 'Commodities');
    expect(commoditiesLimits.first.payoutLimit, 5000.0);
    expect(commoditiesLimits.first.profileName, 'moderate_risk');
    expect(commoditiesLimits.first.turnoverLimit, 50000.0);
  });
}
