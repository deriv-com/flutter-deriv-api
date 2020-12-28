/// Exchange rates send model class
abstract class ExchangeRatesSendModel {
  /// Initializes
  ExchangeRatesSendModel({
    @required this.exchangeRates,
    @required this.baseCurrency,
  });

  /// Must be `1`
  final int exchangeRates;

  /// Base currency (can be obtained from `payout_currencies` call)
  final String baseCurrency;
}

/// Exchange rates send class
class ExchangeRatesSend extends ExchangeRatesSendModel {
  /// Initializes
  ExchangeRatesSend({
    @required int exchangeRates,
    @required String baseCurrency,
  }) : super(
          exchangeRates: exchangeRates,
          baseCurrency: baseCurrency,
        );

  /// Creates an instance from JSON
  factory ExchangeRatesSend.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesSend(
        exchangeRates: json['exchange_rates'],
        baseCurrency: json['base_currency'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['exchange_rates'] = exchangeRates;
    result['base_currency'] = baseCurrency;

    return result;
  }

  /// Creates a copy of instance with given parameters
  ExchangeRatesSend copyWith({
    int exchangeRates,
    String baseCurrency,
  }) =>
      ExchangeRatesSend(
        exchangeRates: exchangeRates ?? this.exchangeRates,
        baseCurrency: baseCurrency ?? this.baseCurrency,
      );
}
