import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/account/account_currency/set_account_currency.dart';
import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Set Account Currency Test', () async {
    final SetAccountCurrency setAccountCurrency =
        await SetAccountCurrency.setCurrency(
      const SetAccountCurrencyRequest(setAccountCurrency: 'USD'),
    );

    expect(setAccountCurrency.succeeded, true);
  });
}
