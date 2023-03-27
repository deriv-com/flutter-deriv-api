import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/balance_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/balance_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  group('Balance Group ->', () {
    test('Fetch Balance Test', () async {
      final BalanceResponse balance = await BalanceResponse.fetchBalance(
        const BalanceRequest(
          account: 'all',
        ),
      );

      expect(balance.balance?.balance, 9650.74);
      expect(balance.balance?.currency, 'USD');
      expect(balance.balance?.id, '811e7ac4-1454-b909-6adb-904a2e9cb374');
      expect(balance.balance?.loginid, 'VRTC2351953');
      expect(balance.balance?.accounts?.length, 1);
      expect(
          balance.balance?.accounts?.entries.first.value.type, TypeEnum.deriv);
      expect(balance.balance?.accounts?.entries.first.key, 'VRTC2351953');
      expect(balance.balance?.accounts?.entries.first.value.convertedAmount,
          10006.86);
      expect(
          balance.balance?.accounts?.entries.first.value.demoAccount, isTrue);
      expect(balance.balance?.accounts?.entries.first.value.currency, 'USD');
      expect(balance.balance?.total?.derivDemo?.amount, 9650.74);
      expect(balance.balance?.total?.deriv?.amount, 0);
    });

    test('Subscribe Balance Test', () {
      BalanceResponse.subscribeBalance(const BalanceRequest(account: 'current'))
          .listen(
        expectAsync1(
          (BalanceResponse? balance) {
            expect(balance?.balance?.balance, 9650.74);
            expect(balance?.balance?.currency, 'USD');
            expect(
                balance?.balance?.id, '811e7ac4-1454-b909-6adb-904a2e9cb374');
            expect(balance?.balance?.loginid, 'VRTC2351953');
            expect(
              balance?.balance?.id,
              '811e7ac4-1454-b909-6adb-904a2e9cb374',
            );
          },
        ),
      );
    });
  });
}
