import 'base_model.dart';
import 'lc_changeable_filed_model.dart';
import 'lc_currency_model.dart';
import 'lc_requirement_model.dart';

/// Model class for landing company detail
abstract class LandingCompanyDetailModel extends BaseModel {
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

  /// Landing Company address.
  final List<String> address;

  /// Special conditions for changing sensitive fields
  final List<LCChangeableFiledModel> changeableFields;

  /// Landing Company country.
  final String country;

  /// The configuration of each currency.
  final List<LCCurrencyModel> marketsCurrencies;

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
  final List<LCRequirementModel> requirements;

  /// Landing Company shortcode.
  final String shortcode;
}
