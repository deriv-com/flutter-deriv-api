import 'package:flutter_deriv_api/api/common/models/landing_company_currency_model.dart';
import 'package:flutter_deriv_api/api/common/models/landing_company_fields_info_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Model class for landing company detail
class LandingCompanyDetailModel extends APIBaseModel {
  /// Initializes
  LandingCompanyDetailModel({
    this.address,
    this.changeableFields,
    this.country,
    this.marketsCurrencies,
    this.hasRealityCheck,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.requirements,
    this.shortCode,
  });

  /// Creates an instance from JSON
  factory LandingCompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailModel(
        address: json['address'] == null || json['address'].isEmpty
            ? null
            : json['address']
                .map<String>((dynamic item) => item.toString())
                .toList(),
        changeableFields: getListFromMap(
          json['changeable_fields']?.entries,
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyFieldsInfoModel.fromJson(item.key, item.value),
        ),
        country: json['country'],
        marketsCurrencies: getListFromMap(
          json['currency_config']?.entries,
          itemToTypeCallback: (dynamic item) =>
              LandingCompanyCurrencyModel.fromJson(item.key, item.value),
        ),
        hasRealityCheck: getBool(json['has_reality_check']),
        legalAllowedContractCategories: getListFromMap(
          json['legal_allowed_contract_categories'],
        ),
        legalAllowedCurrencies: getListFromMap(
          json['legal_allowed_currencies'],
        ),
        legalAllowedMarkets: getListFromMap(
          json['legal_allowed_markets'],
        ),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        requirements: json['requirements'],
        shortCode: json['shortcode'],
      );

  /// Landing Company address.
  final List<String> address;

  /// Special conditions for changing sensitive fields
  final List<LandingCompanyFieldsInfoModel> changeableFields;

  /// Landing Company country.
  final String country;

  /// The configuration of each currency.
  final List<LandingCompanyCurrencyModel> marketsCurrencies;

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
  /// Made it Map for now cause comes with different scenarios from the BE
  final Map<String, dynamic> requirements;

  /// Landing Company short code.
  final String shortCode;

  /// Create a new instance with given parameters
  LandingCompanyDetailModel copyWith({
    List<String> address,
    List<LandingCompanyFieldsInfoModel> changeableFields,
    String country,
    List<LandingCompanyCurrencyModel> marketsCurrencies,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    Map<String, dynamic> requirements,
    String shortCode,
  }) =>
      LandingCompanyDetailModel(
        address: address ?? this.address,
        changeableFields: changeableFields ?? this.changeableFields,
        country: country ?? this.country,
        marketsCurrencies: marketsCurrencies ?? this.marketsCurrencies,
        hasRealityCheck: hasRealityCheck ?? this.hasRealityCheck,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        requirements: requirements ?? this.requirements,
        shortCode: shortCode ?? this.shortCode,
      );
}
