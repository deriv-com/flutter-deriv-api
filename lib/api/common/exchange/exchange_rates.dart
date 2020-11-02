import 'package:flutter_deriv_api/api/common/exchange/exceptions/exchange_exception.dart';
import 'package:flutter_deriv_api/api/common/models/exchange_rates_model.dart';
import 'package:flutter_deriv_api/api/common/models/rate_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
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

  /// Generates an instance from JSON
  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        baseCurrency: json['base_currency'],
        date: getDateTime(json['date']),
        rates: getListFromMap(
          json['rates']?.entries,
          itemToTypeCallback: (dynamic item) => RateModel.fromJson(
            <String, dynamic>{
              'key': item.key,
              'values': item.value,
            },
          ),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generates a copy of instance with given parameters
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

  /// Retrieves the exchange rates from a base currency to all currencies supported by the system.
  ///
  /// For parameters information refer to [ExchangeRatesRequest].
  /// Throws an [ExchangeException] if API response contains an error
  static Future<ExchangeRates> fetchExchangeRates(
    ExchangeRatesRequest request,
  ) async {
    final ExchangeRatesResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseException baseException}) => ExchangeException(
          code: baseException.code, message: baseException.message),
    );

    return ExchangeRates.fromJson(response.exchangeRates);
  }
}
