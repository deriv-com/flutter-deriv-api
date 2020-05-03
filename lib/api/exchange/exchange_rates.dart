import 'package:flutter_deriv_api/api/models/exchange_rates_model.dart';
import 'package:flutter_deriv_api/api/models/rate_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Exchange rates class
class ExchangeRates extends ExchangeRatesModel {
  /// Initializes
  ExchangeRates({
    String baseCurrency,
    DateTime date,
    List<RateModel> rates,
  }) : super(
          baseCurrency: baseCurrency,
          date: date,
          rates: rates,
        );

  /// Generate an instance from json
  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        baseCurrency: json['base_currency'],
        date: getDateTime(json['date']),
        rates: json['rates'] == null
            ? null
            : json['rates']
                .entries
                .map<RateModel>(
                  (dynamic item) => RateModel.fromJson(
                    <String, dynamic>{
                      'key': item.key,
                      'values': item.value,
                    },
                  ),
                )
                .toList(),
      );

  /// Generate a copy of instance with given parameters
  ExchangeRates copyWith({
    String baseCurrency,
    DateTime date,
    List<RateModel> rates,
  }) =>
      ExchangeRates(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        date: date ?? this.date,
        rates: rates ?? this.rates,
      );
}
