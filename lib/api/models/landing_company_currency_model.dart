import 'base_model.dart';
import 'landing_company_currency_config_model.dart';

/// Landing company currency model
class LandingCompanyCurrencyModel extends BaseModel {
  /// Initializes
  LandingCompanyCurrencyModel({
    this.currencies,
    this.market,
  });

  /// Creates instance from JSON
  factory LandingCompanyCurrencyModel.fromJson(
    String marketName,
    Map<String, dynamic> currenciesMap,
  ) =>
      LandingCompanyCurrencyModel(
        market: marketName,
        currencies: currenciesMap.entries
            .map<LandingCompanyCurrencyConfigModel>((dynamic entry) =>
                LandingCompanyCurrencyConfigModel.fromJson(entry.key, entry.value))
            .toList(),
      );

  /// Currencies for this market
  final List<LandingCompanyCurrencyConfigModel> currencies;

  /// Name of the market.
  final String market;

  /// Creates a copy of instance with given parameters
  LandingCompanyCurrencyModel copyWith({
    String market,
  }) =>
      LandingCompanyCurrencyModel(
        market: market ?? this.market,
      );
}
