

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/basic_api/generated/set_account_currency_send.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_deriv_api/api/response/set_account_currency_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Set Account Currency Test', () async {
    final SetAccountCurrencyResponse setAccountCurrency =
        await SetAccountCurrencyResponse.setCurrency(
      const SetAccountCurrencySend(setAccountCurrency: 'USD'),
    );

    expect(setAccountCurrency.setAccountCurrency, true);
  });
}
