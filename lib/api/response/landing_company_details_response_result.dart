// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Landing company details response model class.
abstract class LandingCompanyDetailsResponseModel {
  /// Initializes Landing company details response model class .
  LandingCompanyDetailsResponseModel({
    this.landingCompanyDetails,
  });

  /// The detailed information of the requested landing company.
  final LandingCompanyDetails? landingCompanyDetails;
}

/// Landing company details response class.
class LandingCompanyDetailsResponse extends LandingCompanyDetailsResponseModel {
  /// Initializes Landing company details response class.
  LandingCompanyDetailsResponse({
    LandingCompanyDetails? landingCompanyDetails,
  }) : super(
          landingCompanyDetails: landingCompanyDetails,
        );

  /// Creates an instance from JSON.
  factory LandingCompanyDetailsResponse.fromJson(
    dynamic landingCompanyDetailsJson,
  ) =>
      LandingCompanyDetailsResponse(
        landingCompanyDetails: landingCompanyDetailsJson == null
            ? null
            : LandingCompanyDetails.fromJson(landingCompanyDetailsJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (landingCompanyDetails != null) {
      resultMap['landing_company_details'] = landingCompanyDetails!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LandingCompanyDetailsResponse copyWith({
    LandingCompanyDetails? landingCompanyDetails,
  }) =>
      LandingCompanyDetailsResponse(
        landingCompanyDetails:
            landingCompanyDetails ?? this.landingCompanyDetails,
      );
}
/// Landing company details model class.
abstract class LandingCompanyDetailsModel {
  /// Initializes Landing company details model class .
  LandingCompanyDetailsModel({
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

  /// Landing Company address.
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country.
  final String? country;

  /// The configuration of each currency.
  final CurrencyConfig? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String>? legalAllowedContractCategories;

  /// Allowable currencies for accounts with this Landing Company.
  final List<String>? legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String>? legalAllowedMarkets;

  /// Default currency of client accounts with this Landing Company.
  final String? legalDefaultCurrency;

  /// Landing Company name.
  final String? name;

  /// Legal requirements for the given Landing Company.
  final Map<String, dynamic>? requirements;

  /// Landing Company shortcode.
  final String? shortcode;
}

/// Landing company details class.
class LandingCompanyDetails extends LandingCompanyDetailsModel {
  /// Initializes Landing company details class.
  LandingCompanyDetails({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    CurrencyConfig? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) : super(
          address: address,
          changeableFields: changeableFields,
          country: country,
          currencyConfig: currencyConfig,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
        );

  /// Creates an instance from JSON.
  factory LandingCompanyDetails.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetails(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'] == null
            ? null
            : CurrencyConfig.fromJson(json['currency_config']),
        hasRealityCheck: getBool(json['has_reality_check']),
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(
                    json['legal_allowed_contract_categories']?.map(
                      (dynamic item) => item,
                    ),
                  ),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies']?.map(
                  (dynamic item) => item,
                ),
              ),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets']?.map(
                  (dynamic item) => item,
                ),
              ),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        requirements: json['requirements'],
        shortcode: json['shortcode'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] = address!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['changeable_fields'] = changeableFields;
    resultMap['country'] = country;
    if (currencyConfig != null) {
      resultMap['currency_config'] = currencyConfig!.toJson();
    }
    resultMap['has_reality_check'] = hasRealityCheck;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories!
              .map<dynamic>(
                (String item) => item,
              )
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] = legalAllowedCurrencies!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] = legalAllowedMarkets!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['requirements'] = requirements;
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LandingCompanyDetails copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    CurrencyConfig? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) =>
      LandingCompanyDetails(
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
/// Currency config model class.
abstract class CurrencyConfigModel {
  /// Initializes Currency config model class .
  CurrencyConfigModel({
    this.market,
  });

  /// Name of market.
  final Market? market;
}

/// Currency config class.
class CurrencyConfig extends CurrencyConfigModel {
  /// Initializes Currency config class.
  CurrencyConfig({
    Market? market,
  }) : super(
          market: market,
        );

  /// Creates an instance from JSON.
  factory CurrencyConfig.fromJson(Map<String, dynamic> json) => CurrencyConfig(
        market: json['market'] == null ? null : Market.fromJson(json['market']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (market != null) {
      resultMap['market'] = market!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrencyConfig copyWith({
    Market? market,
  }) =>
      CurrencyConfig(
        market: market ?? this.market,
      );
}
/// Market model class.
abstract class MarketModel {
  /// Initializes Market model class .
  MarketModel({
    this.currency,
  });

  /// Currency Symbol.
  final Currency? currency;
}

/// Market class.
class Market extends MarketModel {
  /// Initializes Market class.
  Market({
    Currency? currency,
  }) : super(
          currency: currency,
        );

  /// Creates an instance from JSON.
  factory Market.fromJson(Map<String, dynamic> json) => Market(
        currency: json['currency'] == null
            ? null
            : Currency.fromJson(json['currency']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (currency != null) {
      resultMap['currency'] = currency!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Market copyWith({
    Currency? currency,
  }) =>
      Market(
        currency: currency ?? this.currency,
      );
}
/// Currency model class.
abstract class CurrencyModel {
  /// Initializes Currency model class .
  CurrencyModel({
    this.maxPayout,
    this.minStake,
  });

  /// Maximum payout for this currency in this market.
  final int? maxPayout;

  /// Minimum stake for this currency in this market.
  final int? minStake;
}

/// Currency class.
class Currency extends CurrencyModel {
  /// Initializes Currency class.
  Currency({
    int? maxPayout,
    int? minStake,
  }) : super(
          maxPayout: maxPayout,
          minStake: minStake,
        );

  /// Creates an instance from JSON.
  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        maxPayout: json['max_payout'],
        minStake: json['min_stake'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['max_payout'] = maxPayout;
    resultMap['min_stake'] = minStake;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Currency copyWith({
    int? maxPayout,
    int? minStake,
  }) =>
      Currency(
        maxPayout: maxPayout ?? this.maxPayout,
        minStake: minStake ?? this.minStake,
      );
}