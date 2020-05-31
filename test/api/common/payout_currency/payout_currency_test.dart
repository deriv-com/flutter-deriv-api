import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/payout_currency/payout_currency.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  setUp(() {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);
  });

  test('Fetch Payout Currencies Test', () async {
    final List<PayoutCurrency> currencies =
        await PayoutCurrency.fetchPayoutCurrencies();

    expect(currencies.length, 4);
    expect(currencies.first.currency, 'AUD');
  });
}
