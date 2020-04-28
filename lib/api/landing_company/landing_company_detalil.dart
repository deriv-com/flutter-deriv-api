import 'package:flutter_deriv_api/api/models/landing_company_detail_model.dart';
import 'package:flutter_deriv_api/api/models/lc_requirement_model.dart';
import 'package:flutter_deriv_api/api/models/lc_changeable_filed_model.dart';
import 'package:flutter_deriv_api/api/models/lc_currency_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Landing company details
class LandingCompanyDetail extends LandingCompanyDetailModel {
  /// Initializes
  LandingCompanyDetail({
    List<String> address,
    List<LCChangeableFiledModel> changeableFields,
    String country,
    List<LCCurrencyModel> marketsCurrencies,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    List<LCRequirementModel> requirements,
    String shortcode,
  }) : super(
          address: address,
          changeableFields: changeableFields,
          country: country,
          marketsCurrencies: marketsCurrencies,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
        );

  /// Creates instance from JSON
  factory LandingCompanyDetail.fromJson(Map<String, dynamic> json) =>
      LandingCompanyDetail(
        address: json['address'] == null || (json['address'] is Map)
            ? null
            : json['address']
                .map<String>((dynamic item) => item.toString())
                .toList(),
        changeableFields: json['changeable_fields'] == null
            ? null
            : json['changeable_fields']
                .entries
                .map<LCChangeableFiledModel>((dynamic entry) =>
                    LCChangeableFiledModel.fromJson(entry.key, entry.value))
                .toList(),
        country: json['country'],
        marketsCurrencies: json['currency_config'] == null
            ? null
            : json['currency_config']
                .entries
                .map<LCCurrencyModel>((dynamic entry) =>
                    LCCurrencyModel.fromJson(entry.key, entry.value))
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
                .map<LCRequirementModel>((dynamic entry) =>
                    LCRequirementModel.fromJson(entry.key, entry.value))
                .toList(),
        shortcode: json['shortcode'],
      );

  /// Create a new instance with given parameters
  LandingCompanyDetail copyWith({
    List<String> address,
    List<LCChangeableFiledModel> changeableFields,
    String country,
    List<LCCurrencyModel> marketsCurrencies,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    List<LCRequirementModel> requirements,
    String shortcode,
  }) =>
      LandingCompanyDetail(
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
