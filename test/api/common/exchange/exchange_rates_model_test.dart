import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/common/exchange/exchange_rates.dart';
import 'package:flutter_deriv_api/api/common/models/rate_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'exchange_rates_model_mock_data.dart';

void main() {
  test('exchange rates json parsing', () {
    final Map<String, dynamic> mapData = jsonDecode(exchangeRatesModelMockData);
    final ExchangeRates exchangeRates =
        ExchangeRates.fromJson(mapData['exchange_rates']);

    expect(exchangeRates.baseCurrency, 'USD');
    expect(exchangeRates.date, getDateTime(1588064134));

    expect(exchangeRates.rates.length, 9);

    final List<RateModel> rates = exchangeRates.rates;

    expect(rates[4].code, 'GBP');
    expect(rates[4].rate, 0.8);
  });
}
