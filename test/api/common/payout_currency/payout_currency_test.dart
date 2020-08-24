import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/payout_currency/payout_currency.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Payout Currencies Test', () async {
    final List<PayoutCurrency> currencies =
        await PayoutCurrency.fetchPayoutCurrencies();

    expect(currencies.length, 4);
    expect(currencies.first.currency, 'AUD');
  });
}
