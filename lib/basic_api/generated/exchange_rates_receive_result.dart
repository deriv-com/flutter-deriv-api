/// Exchange rates receive model class
abstract class ExchangeRatesReceiveModel {
  /// Initializes
  ExchangeRatesReceiveModel({
    @required this.exchangeRates,
  });

  /// Exchange rate values from base to all other currencies
  final ExchangeRates exchangeRates;
}

/// Exchange rates receive class
class ExchangeRatesReceive extends ExchangeRatesReceiveModel {
  /// Initializes
  ExchangeRatesReceive({
    @required ExchangeRates exchangeRates,
  }) : super(
          exchangeRates: exchangeRates,
        );

  /// Creates an instance from JSON
  factory ExchangeRatesReceive.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesReceive(
        exchangeRates: json['exchange_rates'] == null
            ? null
            : ExchangeRates.fromJson(json['exchange_rates']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (exchangeRates != null) {
      result['exchange_rates'] = exchangeRates.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  ExchangeRatesReceive copyWith({
    ExchangeRates exchangeRates,
  }) =>
      ExchangeRatesReceive(
        exchangeRates: exchangeRates ?? this.exchangeRates,
      );
}
/// Exchange rates model class
abstract class ExchangeRatesModel {
  /// Initializes
  ExchangeRatesModel({
    @required this.baseCurrency,
    @required this.date,
    @required this.rates,
  });

  /// Base currency
  final String baseCurrency;

  /// Date retrieval epoch time represented as an integer number
  final int date;

  /// Rates of exchanging a unit of base currency into the target currencies
  final Map<String, dynamic> rates;
}

/// Exchange rates class
class ExchangeRates extends ExchangeRatesModel {
  /// Initializes
  ExchangeRates({
    @required String baseCurrency,
    @required int date,
    @required Map<String, dynamic> rates,
  }) : super(
          baseCurrency: baseCurrency,
          date: date,
          rates: rates,
        );

  /// Creates an instance from JSON
  factory ExchangeRates.fromJson(Map<String, dynamic> json) => ExchangeRates(
        baseCurrency: json['base_currency'],
        date: json['date'],
        rates: json['rates'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['base_currency'] = baseCurrency;
    result['date'] = date;
    result['rates'] = rates;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ExchangeRates copyWith({
    String baseCurrency,
    int date,
    Map<String, dynamic> rates,
  }) =>
      ExchangeRates(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        date: date ?? this.date,
        rates: rates ?? this.rates,
      );
}
