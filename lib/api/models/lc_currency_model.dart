import 'base_model.dart';

/// Market currency config model
class LCCurrencyModel extends BaseModel {
  /// Initializes
  LCCurrencyModel({
    this.currencies,
    this.market,
  });

  /// Creates instance from JSON
  factory LCCurrencyModel.fromJson(
    String marketName,
    Map<String, dynamic> currenciesMap,
  ) =>
      LCCurrencyModel(
        market: marketName,
        currencies: currenciesMap.entries
            .map<MarketCurrencyConfig>((dynamic entry) =>
                MarketCurrencyConfig.fromJson(entry.key, entry.value))
            .toList(),
      );

  /// Name of the market.
  final String market;

  /// Currencies for this market
  final List<MarketCurrencyConfig> currencies;

  /// Creates a copy of instance with given parameters
  LCCurrencyModel copyWith({
    String market,
  }) =>
      LCCurrencyModel(
        market: market ?? this.market,
      );
}

/// Currency model class
class MarketCurrencyConfig extends BaseModel {
  /// Initializes
  MarketCurrencyConfig({
    this.code,
    this.maxPayout,
    this.minStake,
  });

  /// Creates instance from JSON
  factory MarketCurrencyConfig.fromJson(
    String code,
    Map<String, dynamic> currencyMap,
  ) =>
      MarketCurrencyConfig(
        code: code,
        maxPayout: currencyMap['max_payout']?.toDouble(),
        minStake: currencyMap['min_stake']?.toDouble(),
      );

  /// Code of the currency
  final String code;

  /// Currency's max payout
  final double maxPayout;

  /// Currency's min stake
  final double minStake;
}
