import '../../basic_api/generated/exchange_rates_receive.dart';
import '../../basic_api/generated/exchange_rates_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Exchange rates response model class.
abstract class ExchangeRatesResponseModel {
  /// Initializes Exchange rates response model class .
  ExchangeRatesResponseModel({
    this.exchangeRates,
  });

  /// Exchange rate values from base to all other currencies
  final ExchangeRates? exchangeRates;
}

/// Exchange rates response class.
class ExchangeRatesResponse extends ExchangeRatesResponseModel {
  /// Initializes Exchange rates response class.
  ExchangeRatesResponse({
    ExchangeRates? exchangeRates,
  }) : super(
          exchangeRates: exchangeRates,
        );

  /// Creates an instance from JSON.
  factory ExchangeRatesResponse.fromJson(
    dynamic exchangeRatesJson,
  ) =>
      ExchangeRatesResponse(
        exchangeRates: exchangeRatesJson == null
            ? null
            : ExchangeRates.fromJson(exchangeRatesJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (exchangeRates != null) {
      resultMap['exchange_rates'] = exchangeRates!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Retrieves the exchange rates from a base currency to all currencies supported by the system.
  ///
  /// For parameters information refer to [ExchangeRatesRequest].
  /// Throws an [ExchangeException] if API response contains an error
  static Future<ExchangeRates?> fetchExchangeRates(
    ExchangeRatesRequest request,
  ) async {
    final ExchangeRatesReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          ExchangeException(baseExceptionModel: baseExceptionModel),
    );

    return response.exchangeRates == null
        ? null
        : ExchangeRates.fromJson(response.exchangeRates!);
  }

  /// Creates a copy of instance with given parameters.
  ExchangeRatesResponse copyWith({
    ExchangeRates? exchangeRates,
  }) =>
      ExchangeRatesResponse(
        exchangeRates: exchangeRates ?? this.exchangeRates,
      );
}
/// Exchange rates model class.
abstract class ExchangeRatesModel {
  /// Initializes Exchange rates model class .
  ExchangeRatesModel({
    this.baseCurrency,
    this.date,
    this.rates,
  });

  /// Base currency
  final String? baseCurrency;

  /// Date retrieval epoch time represented as an integer number
  final DateTime? date;

  /// Rates of exchanging a unit of base currency into the target currencies
  final Map<String, double>? rates;
}

/// Exchange rates class.
class ExchangeRates extends ExchangeRatesModel {
  /// Initializes Exchange rates class.
  ExchangeRates({
    String? baseCurrency,
    DateTime? date,
    Map<String, double>? rates,
  }) : super(
          baseCurrency: baseCurrency,
          date: date,
          rates: rates,
        );

  /// Creates an instance from JSON.
  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        baseCurrency: json['base_currency'],
        date: getDateTime(json['date']),
        rates: json['rates'] == null
            ? null
            : Map<String, double>.fromEntries(json['rates']
                .entries
                .map<MapEntry<String, double>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, double>(
                            entry.key, getDouble(entry.value)!))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['base_currency'] = baseCurrency;
    resultMap['date'] = getSecondsSinceEpochDateTime(date);
    resultMap['rates'] = rates;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ExchangeRates copyWith({
    String? baseCurrency,
    DateTime? date,
    Map<String, double>? rates,
  }) =>
      ExchangeRates(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        date: date ?? this.date,
        rates: rates ?? this.rates,
      );
}
