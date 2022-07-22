import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_limits/account_limits.dart';
import 'package:flutter_deriv_api/api/account/models/market_limit_model.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

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

    final MarketLimitModel firstCommoditiesLimit =
        accountLimits.marketSpecific!.first!.marketLimits!.first!;

    expect(firstCommoditiesLimit.name, 'Commodities');
    expect(firstCommoditiesLimit.payoutLimit, 5000.0);
    expect(firstCommoditiesLimit.profileName, 'moderate_risk');
    expect(firstCommoditiesLimit.turnoverLimit, 50000.0);
  });
}
