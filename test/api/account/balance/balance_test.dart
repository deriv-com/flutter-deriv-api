import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/balance/balance.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  group('Balance group', () {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    test('Fetch balance', () async {
      final Balance balance = await Balance.fetchBalance(
        const BalanceRequest(
          account: 'current',
        ),
      );

      expect(balance.balance, 9650.74);
      expect(balance.currency, 'USD');
      expect(balance.id, '811e7ac4-1454-b909-6adb-904a2e9cb374');
      expect(balance.loginId, 'VRTC2351953');
    });

    test('Subscribe balance', () {
      Balance.subscribeBalance(const BalanceRequest(account: 'current'))
          .take(1)
          .listen(
        expectAsync1(
          (Balance balance) {
            expect(balance.balance, 9650.74);
            expect(balance.currency, 'USD');
            expect(balance.id, '811e7ac4-1454-b909-6adb-904a2e9cb374');
            expect(balance.loginId, 'VRTC2351953');
            expect(
              balance.subscriptionInformation.id,
              '811e7ac4-1454-b909-6adb-904a2e9cb374',
            );
          },
        ),
      );
    });
  });
}
