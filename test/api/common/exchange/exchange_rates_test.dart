import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/response/exchange_rates_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/exchange_rates_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector().dispose());

  test('Fetch Exchange Rates', () async {
    final ExchangeRates? exchangeRates =
        await ExchangeRatesResponse.fetchExchangeRates(
      const ExchangeRatesRequest(baseCurrency: 'USD'),
    );

    expect(exchangeRates?.baseCurrency, 'USD');
    expect(exchangeRates?.date, getDateTime(1588064134));

    expect(exchangeRates?.rates!.length, 9);

    final Map<String, double>? rates = exchangeRates?.rates;

    expect(rates?.entries.toList()[4].key, 'GBP');
    expect(rates?.entries.toList()[4].value, 0.8);
  });
}
