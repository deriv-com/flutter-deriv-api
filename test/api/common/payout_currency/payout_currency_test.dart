import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/payout_currencies_receive_result.dart';

void main() {
  setUp(() => APIInitializer().initialize(isMock: true));

  test('Fetch Payout Currencies Test', () async {
    final PayoutCurrenciesResponse currencies =
        await PayoutCurrenciesResponse.fetchPayoutCurrencies();

    expect(currencies.payoutCurrencies?.length, 4);
    expect(currencies.payoutCurrencies?.first, 'AUD');
  });
}
