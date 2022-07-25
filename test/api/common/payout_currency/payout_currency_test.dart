import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/payout_currencies_response_result.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Fetch Payout Currencies Test', () async {
    final PayoutCurrenciesResponse currencies =
        await PayoutCurrenciesResponse.fetchPayoutCurrencies();

    expect(currencies.payoutCurrencies?.length, 4);
    expect(currencies.payoutCurrencies?.first, 'AUD');
  });
}
