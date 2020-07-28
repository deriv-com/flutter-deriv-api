import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/common/exchange/exchange_rates.dart';
import 'package:flutter_deriv_api/api/common/models/rate_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(true));

  test('Fetch Exchange Rates', () async {
    final ExchangeRates exchangeRates = await ExchangeRates.fetchExchangeRates(
      const ExchangeRatesRequest(baseCurrency: 'USD'),
    );

    expect(exchangeRates.baseCurrency, 'USD');
    expect(exchangeRates.date, getDateTime(1588064134));

    expect(exchangeRates.rates.length, 9);

    final List<RateModel> rates = exchangeRates.rates;

    expect(rates[4].code, 'GBP');
    expect(rates[4].rate, 0.8);
  });
}
