import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/balance/balance.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUpAll(() => APIInitializer().initialize(isMock: true));

  group('Balance Group ->', () {
    test('Fetch Balance Test', () async {
      final Balance balance = await Balance.fetchBalance(
        const BalanceRequest(
          account: 'all',
        ),
      );

      expect(balance.balance, 9650.74);
      expect(balance.currency, 'USD');
      expect(balance.id, '811e7ac4-1454-b909-6adb-904a2e9cb374');
      expect(balance.loginId, 'VRTC2351953');
      expect(balance.accounts.length, 1);
      expect(balance.accounts.first.loginId, 'VRTC2351953');
      expect(balance.accounts.first.convertedAmount, 10006.86);
      expect(balance.accounts.first.demoAccount, isTrue);
      expect(balance.accounts.first.currency, 'USD');
      expect(balance.total.derivDemo.amount, 9650.74);
      expect(balance.total.deriv.amount, 0);
    });

    test('Subscribe Balance Test', () {
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
