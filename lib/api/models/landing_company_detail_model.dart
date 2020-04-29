import 'package:flutter_deriv_api/utils/helpers.dart';

import 'base_model.dart';
import 'landing_company_currency_model.dart';
import 'landing_company_fields_info_model.dart';

/// Model class for landing company detail
class LandingCompanyDetailModel extends BaseModel {
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
    this.shortcode,
  });

  /// Creates instance from JSON
  factory LandingCompanyDetailModel.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetailModel(
        address: json['address'] == null || (json['address'] is Map)
            ? null
            : json['address']
                .map<String>((dynamic item) => item.toString())
                .toList(),
        changeableFields: json['changeable_fields'] == null
            ? null
            : json['changeable_fields']
                .entries
                .map<LandingCompanyFieldsInfoModel>((dynamic entry) =>
                    LandingCompanyFieldsInfoModel.fromJson(entry.key, entry.value))
                .toList(),
        country: json['country'],
        marketsCurrencies: json['currency_config'] == null
            ? null
            : json['currency_config']
                .entries
                .map<LandingCompanyCurrencyModel>((dynamic entry) =>
                    LandingCompanyCurrencyModel.fromJson(entry.key, entry.value))
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
        requirements: json['requirements'] == null
            ? null
            : json['requirements']
                .entries
                .map<LandingCompanyFieldsInfoModel>((dynamic entry) =>
                    entry.value == null || entry.value is Map
                        ? null
                        : LandingCompanyFieldsInfoModel.fromJson(entry.key, entry.value))
                .toList(),
        shortcode: json['shortcode'],
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
  final List<LandingCompanyFieldsInfoModel> requirements;

  /// Landing Company shortcode.
  final String shortcode;

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
    List<LandingCompanyFieldsInfoModel> requirements,
    String shortcode,
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
        shortcode: shortcode ?? this.shortcode,
      );
}
