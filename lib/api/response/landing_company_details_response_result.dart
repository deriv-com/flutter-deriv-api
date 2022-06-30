// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';
/// Landing company details response model class.
abstract class LandingCompanyDetailsResponseModel extends Equatable {
  /// Initializes Landing company details response model class .
  const LandingCompanyDetailsResponseModel({
    this.landingCompanyDetails,
  });

  /// The detailed information of the requested landing company.
  final LandingCompanyDetails? landingCompanyDetails;
}

/// Landing company details response class.
class LandingCompanyDetailsResponse extends LandingCompanyDetailsResponseModel {
  /// Initializes Landing company details response class.
  const LandingCompanyDetailsResponse({
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Landing company details model class.
abstract class LandingCompanyDetailsModel extends Equatable {
  /// Initializes Landing company details model class .
  const LandingCompanyDetailsModel({
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
    this.supportProfessionalClient,
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

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Landing company details class.
class LandingCompanyDetails extends LandingCompanyDetailsModel {
  /// Initializes Landing company details class.
  const LandingCompanyDetails({
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
    bool? supportProfessionalClient,
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
          supportProfessionalClient: supportProfessionalClient,
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
        supportProfessionalClient: getBool(json['support_professional_client']),
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
    resultMap['support_professional_client'] = supportProfessionalClient;

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
    bool? supportProfessionalClient,
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
        supportProfessionalClient:
            supportProfessionalClient ?? this.supportProfessionalClient,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Currency config model class.
abstract class CurrencyConfigModel extends Equatable {
  /// Initializes Currency config model class .
  const CurrencyConfigModel({
    this.basketIndex,
    this.commodities,
    this.cryptocurrency,
    this.forex,
    this.indices,
    this.market,
    this.syntheticIndex,
  });

  /// Name of basket_index.
  final Map<String, dynamic>? basketIndex;

  /// Name of commodities.
  final Map<String, dynamic>? commodities;

  /// Name of cryptocurrency.
  final Map<String, dynamic>? cryptocurrency;

  /// Name of forex.
  final Map<String, dynamic>? forex;

  /// Name of indices.
  final Map<String, dynamic>? indices;

  /// Name of market.
  final Market? market;

  /// Name of synthetic index.
  final Map<String, dynamic>? syntheticIndex;
}

/// Currency config class.
class CurrencyConfig extends CurrencyConfigModel {
  /// Initializes Currency config class.
  const CurrencyConfig({
    Map<String, dynamic>? basketIndex,
    Map<String, dynamic>? commodities,
    Map<String, dynamic>? cryptocurrency,
    Map<String, dynamic>? forex,
    Map<String, dynamic>? indices,
    Market? market,
    Map<String, dynamic>? syntheticIndex,
  }) : super(
          basketIndex: basketIndex,
          commodities: commodities,
          cryptocurrency: cryptocurrency,
          forex: forex,
          indices: indices,
          market: market,
          syntheticIndex: syntheticIndex,
        );

  /// Creates an instance from JSON.
  factory CurrencyConfig.fromJson(Map<String, dynamic> json) => CurrencyConfig(
        basketIndex: json['basket_index'],
        commodities: json['commodities'],
        cryptocurrency: json['cryptocurrency'],
        forex: json['forex'],
        indices: json['indices'],
        market: json['market'] == null ? null : Market.fromJson(json['market']),
        syntheticIndex: json['synthetic_index'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['basket_index'] = basketIndex;
    resultMap['commodities'] = commodities;
    resultMap['cryptocurrency'] = cryptocurrency;
    resultMap['forex'] = forex;
    resultMap['indices'] = indices;
    if (market != null) {
      resultMap['market'] = market!.toJson();
    }
    resultMap['synthetic_index'] = syntheticIndex;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CurrencyConfig copyWith({
    Map<String, dynamic>? basketIndex,
    Map<String, dynamic>? commodities,
    Map<String, dynamic>? cryptocurrency,
    Map<String, dynamic>? forex,
    Map<String, dynamic>? indices,
    Market? market,
    Map<String, dynamic>? syntheticIndex,
  }) =>
      CurrencyConfig(
        basketIndex: basketIndex ?? this.basketIndex,
        commodities: commodities ?? this.commodities,
        cryptocurrency: cryptocurrency ?? this.cryptocurrency,
        forex: forex ?? this.forex,
        indices: indices ?? this.indices,
        market: market ?? this.market,
        syntheticIndex: syntheticIndex ?? this.syntheticIndex,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Market model class.
abstract class MarketModel extends Equatable {
  /// Initializes Market model class .
  const MarketModel({
    this.currency,
  });

  /// Currency Symbol.
  final Currency? currency;
}

/// Market class.
class Market extends MarketModel {
  /// Initializes Market class.
  const Market({
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Currency model class.
abstract class CurrencyModel extends Equatable {
  /// Initializes Currency model class .
  const CurrencyModel({
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
  const Currency({
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
