import 'package:flutter_deriv_api/api/common/models/landing_company_currency_config_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Landing company currency model
class LandingCompanyCurrencyModel extends APIBaseModel {
  /// Initializes
  LandingCompanyCurrencyModel({
    this.currencies,
    this.market,
  });

  /// Creates an instance from JSON
  factory LandingCompanyCurrencyModel.fromJson(
    String? marketName,
    Map<String, dynamic> currenciesMap,
  ) =>
      LandingCompanyCurrencyModel(
        market: marketName,
        currencies: currenciesMap.entries
            .map<LandingCompanyCurrencyConfigModel>(
              (dynamic item) => LandingCompanyCurrencyConfigModel.fromJson(
                item.key,
                item.value,
              ),
            )
            .toList(),
      );

  /// Currencies for this market
  final List<LandingCompanyCurrencyConfigModel>? currencies;

  /// Name of the market.
  final String? market;

  /// Creates a copy of instance with given parameters
  LandingCompanyCurrencyModel copyWith({
    String? market,
  }) =>
      LandingCompanyCurrencyModel(
        market: market ?? this.market,
      );
}
