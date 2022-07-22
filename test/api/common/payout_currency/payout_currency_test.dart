import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/payout_currency/payout_currency.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Payout Currencies Test', () async {
    final List<PayoutCurrency?>? currencies =
        await PayoutCurrency.fetchPayoutCurrencies();

    final PayoutCurrency firstCurrency = currencies!.first!;

    expect(currencies.length, 4);
    expect(firstCurrency.currency, 'AUD');
  });
}
