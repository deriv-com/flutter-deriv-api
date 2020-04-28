import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Model class for landing company detail
class LandingCompanyDetailModel {
  /// Initializes
  LandingCompanyDetailModel({
    this.address,
    this.changeableFields,
    this.country,
    this.currencyConfig,
    this.hasRealityCheck,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.requirements,
    this.shortcode,
  });

  /// Creates instance from JSON
  factory LandingCompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailModel(
        address: json['address'].toString(),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'] == null
            ? null
            : json['currency_config']
                .entries
                .map<MarketCurrencyConfigModel>((dynamic entry) =>
                    MarketCurrencyConfigModel.fromJson(entry.key, entry.value))
                .toList(),
        hasRealityCheck: getBool(json['has_reality_check']),
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : json['legal_allowed_contract_categories']
                    .map<String>((dynamic entry) => entry.toString())
                    .toList(),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : json['legal_allowed_currencies']
                .map<String>((dynamic entry) => entry.toString())
                .toList(),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : json['legal_allowed_markets']
                .map<String>((dynamic entry) => entry.toString())
                .toList(),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        requirements: json['requirements'],
        shortcode: json['shortcode'],
      );

  /// Landing Company address.
  final String address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic> changeableFields;

  /// Landing Company country.
  final String country;

  /// The configuration of each currency.
  final List<MarketCurrencyConfigModel> currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company
  /// . `true`: applicable, `false`: not applicable. The Reality Check is a feature that
  /// gives a summary of the client's trades and account balances on a regular
  /// basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Allowable currencies for accounts with this Landing Company.
  final List<String> legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Default currency of client accounts with this Landing Company.
  final String legalDefaultCurrency;

  /// Landing Company name.
  final String name;

  /// Legal requirements for the given Landing Company.
  final Map<String, dynamic> requirements;

  /// Landing Company shortcode.
  final String shortcode;

  /// Create a new instance with given parameters
  LandingCompanyDetailModel copyWith({
    String address,
    Map<String, dynamic> changeableFields,
    String country,
    MarketCurrencyConfigModel currencyConfig,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    Map<String, dynamic> requirements,
    String shortcode,
  }) =>
      LandingCompanyDetailModel(
        address: address ?? this.address,
        changeableFields: changeableFields ?? this.changeableFields,
        country: country ?? this.country,
        currencyConfig: currencyConfig ?? this.currencyConfig,
        hasRealityCheck: hasRealityCheck ?? this.hasRealityCheck,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        requirements: requirements ?? this.requirements,
        shortcode: shortcode ?? this.shortcode,
      );
}

/// Market currency config model
class MarketCurrencyConfigModel {
  /// Initializes
  MarketCurrencyConfigModel({
    this.currencies,
    this.market,
  });

  /// Creates instance from JSON
  factory MarketCurrencyConfigModel.fromJson(
    String marketName,
    Map<String, dynamic> currenciesMap,
  ) =>
      MarketCurrencyConfigModel(
        market: marketName,
        currencies: currenciesMap.entries
            .map<Currency>(
                (dynamic entry) => Currency.fromJson(entry.key, entry.value))
            .toList(),
      );

  /// Name of the market.
  final String market;

  /// Currencies for this market
  final List<Currency> currencies;

  /// Creates a copy of instance with given parameters
  MarketCurrencyConfigModel copyWith({
    String market,
  }) =>
      MarketCurrencyConfigModel(
        market: market ?? this.market,
      );
}

/// Currency model class
class Currency extends BaseModel {
  /// Initializes
  Currency({
    this.code,
    this.maxPayout,
    this.minStake,
  });

  /// Creates instance from JSON
  factory Currency.fromJson(
    String code,
    Map<String, dynamic> currencyMap,
  ) =>
      Currency(
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
