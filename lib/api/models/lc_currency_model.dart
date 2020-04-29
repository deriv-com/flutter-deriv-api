import 'base_model.dart';
import 'lc_currency_config.dart';

/// Landing company currency model
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
            .map<LCCurrencyConfig>((dynamic entry) =>
                LCCurrencyConfig.fromJson(entry.key, entry.value))
            .toList(),
      );

  /// Currencies for this market
  final List<LCCurrencyConfig> currencies;

  /// Name of the market.
  final String market;

  /// Creates a copy of instance with given parameters
  LCCurrencyModel copyWith({
    String market,
  }) =>
      LCCurrencyModel(
        market: market ?? this.market,
      );
}
