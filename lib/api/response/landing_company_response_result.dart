// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/landing_company_details_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/landing_company_details_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/landing_company_details_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/landing_company_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/landing_company_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Landing company response model class.
abstract class LandingCompanyResponseModel {
  /// Initializes Landing company response model class .
  const LandingCompanyResponseModel({
    this.landingCompany,
  });

  /// Landing Company
  final LandingCompany? landingCompany;
}

/// Landing company response class.
class LandingCompanyResponse extends LandingCompanyResponseModel {
  /// Initializes Landing company response class.
  const LandingCompanyResponse({
    LandingCompany? landingCompany,
  }) : super(
          landingCompany: landingCompany,
        );

  /// Creates an instance from JSON.
  factory LandingCompanyResponse.fromJson(
    dynamic landingCompanyJson,
  ) =>
      LandingCompanyResponse(
        landingCompany: landingCompanyJson == null
            ? null
            : LandingCompany.fromJson(landingCompanyJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (landingCompany != null) {
      resultMap['landing_company'] = landingCompany!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets landing companies for given [LandingCompanyRequest]
  ///
  /// Throws a [LandingCompanyException] if API response contains an error
  static Future<LandingCompanyResponse> fetchLandingCompanies(
    LandingCompanyRequest request,
  ) async {
    final LandingCompanyReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          LandingCompanyException(baseExceptionModel: baseExceptionModel),
    );

    return LandingCompanyResponse.fromJson(response.landingCompany);
  }

  /// Gets details of a landing company specified in [LandingCompanyDetailsRequest]
  ///
  /// Throws a [LandingCompanyException] if API response contains an error
  static Future<LandingCompanyDetailsResponse> fetchLandingCompanyDetails(
    LandingCompanyDetailsRequest request,
  ) async {
    final LandingCompanyDetailsReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          LandingCompanyException(baseExceptionModel: baseExceptionModel),
    );

    return LandingCompanyDetailsResponse.fromJson(
        response.landingCompanyDetails);
  }

  /// Creates a copy of instance with given parameters.
  LandingCompanyResponse copyWith({
    LandingCompany? landingCompany,
  }) =>
      LandingCompanyResponse(
        landingCompany: landingCompany ?? this.landingCompany,
      );
}
/// Landing company model class.
abstract class LandingCompanyModel {
  /// Initializes Landing company model class .
  const LandingCompanyModel({
    this.addressParseable,
    this.config,
    this.dxtradeAllCompany,
    this.dxtradeFinancialCompany,
    this.dxtradeGamingCompany,
    this.financialCompany,
    this.forbiddenPostcodePattern,
    this.gamingCompany,
    this.gamstopCompany,
    this.id,
    this.isIdvSupported,
    this.lcToOpenMfAccount,
    this.minimumAge,
    this.mt5AgeVerification,
    this.mtFinancialCompany,
    this.mtGamingCompany,
    this.name,
    this.needSetMaxTurnoverLimit,
    this.noProvince,
    this.requireAddressPostcode,
    this.requireAgeVerifiedForSynthetic,
    this.requirePoi,
    this.requireVerificationWhenNotAgeVerified,
    this.skipDepositVerification,
    this.ukgcFundsProtection,
    this.virtualCompany,
  });

  /// Flag to indicate if address parseable or not
  final bool? addressParseable;

  /// Config structure with document types ,taxRequired ,tin format details.
  final Map<String, dynamic>? config;

  /// Available Deriv X all account types (Synthetic Indices and Financials).
  final DxtradeAllCompany? dxtradeAllCompany;

  /// Available Deriv X financial account types (all except Synthetic Indices).
  final DxtradeFinancialCompany? dxtradeFinancialCompany;

  /// Available Deriv X gaming account types (Synthetic Indices).
  final DxtradeGamingCompany? dxtradeGamingCompany;

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final FinancialCompany? financialCompany;

  /// Forbidden postcode pattern
  final String? forbiddenPostcodePattern;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final GamingCompany? gamingCompany;

  /// Gamestop company details.
  final List<String>? gamstopCompany;

  /// Country code
  final String? id;

  /// Flag to indicate if idv is supported or not
  final bool? isIdvSupported;

  /// Open mf account lc details.
  final String? lcToOpenMfAccount;

  /// Minimum age
  final int? minimumAge;

  /// Flag to indicate if mt5 age verification detail.
  final bool? mt5AgeVerification;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices), currently divided into Financial STP, Financial (standard) as subtypes.
  final MtFinancialCompany? mtFinancialCompany;

  /// Landing Company for MT5 standard gaming contracts (Synthetic Indices), currently has Financial as subtype.
  final MtGamingCompany? mtGamingCompany;

  /// Country name
  final String? name;

  /// Flag to indicate whether max turnover limit settings.
  final bool? needSetMaxTurnoverLimit;

  /// Flag to indicate province settings.
  final bool? noProvince;

  /// Flag to indicate whether address postcode is required or not.
  final bool? requireAddressPostcode;

  /// Flag to indicate whether age verification required ofr synthetic or not.
  final bool? requireAgeVerifiedForSynthetic;

  /// Flag to indicate whether poi is required.
  final bool? requirePoi;

  /// Flag to indicate whether verification required if age not verified.
  final bool? requireVerificationWhenNotAgeVerified;

  /// Flag to indicate whether to skip deposit verifcation or not.
  final bool? skipDepositVerification;

  /// Flag to indicate ukgc funds protection setting.
  final bool? ukgcFundsProtection;

  /// Virtual Company
  final String? virtualCompany;
}

/// Landing company class.
class LandingCompany extends LandingCompanyModel {
  /// Initializes Landing company class.
  const LandingCompany({
    bool? addressParseable,
    Map<String, dynamic>? config,
    DxtradeAllCompany? dxtradeAllCompany,
    DxtradeFinancialCompany? dxtradeFinancialCompany,
    DxtradeGamingCompany? dxtradeGamingCompany,
    FinancialCompany? financialCompany,
    String? forbiddenPostcodePattern,
    GamingCompany? gamingCompany,
    List<String>? gamstopCompany,
    String? id,
    bool? isIdvSupported,
    String? lcToOpenMfAccount,
    int? minimumAge,
    bool? mt5AgeVerification,
    MtFinancialCompany? mtFinancialCompany,
    MtGamingCompany? mtGamingCompany,
    String? name,
    bool? needSetMaxTurnoverLimit,
    bool? noProvince,
    bool? requireAddressPostcode,
    bool? requireAgeVerifiedForSynthetic,
    bool? requirePoi,
    bool? requireVerificationWhenNotAgeVerified,
    bool? skipDepositVerification,
    bool? ukgcFundsProtection,
    String? virtualCompany,
  }) : super(
          addressParseable: addressParseable,
          config: config,
          dxtradeAllCompany: dxtradeAllCompany,
          dxtradeFinancialCompany: dxtradeFinancialCompany,
          dxtradeGamingCompany: dxtradeGamingCompany,
          financialCompany: financialCompany,
          forbiddenPostcodePattern: forbiddenPostcodePattern,
          gamingCompany: gamingCompany,
          gamstopCompany: gamstopCompany,
          id: id,
          isIdvSupported: isIdvSupported,
          lcToOpenMfAccount: lcToOpenMfAccount,
          minimumAge: minimumAge,
          mt5AgeVerification: mt5AgeVerification,
          mtFinancialCompany: mtFinancialCompany,
          mtGamingCompany: mtGamingCompany,
          name: name,
          needSetMaxTurnoverLimit: needSetMaxTurnoverLimit,
          noProvince: noProvince,
          requireAddressPostcode: requireAddressPostcode,
          requireAgeVerifiedForSynthetic: requireAgeVerifiedForSynthetic,
          requirePoi: requirePoi,
          requireVerificationWhenNotAgeVerified:
              requireVerificationWhenNotAgeVerified,
          skipDepositVerification: skipDepositVerification,
          ukgcFundsProtection: ukgcFundsProtection,
          virtualCompany: virtualCompany,
        );

  /// Creates an instance from JSON.
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
        addressParseable: getBool(json['address_parseable']),
        config: json['config'],
        dxtradeAllCompany: json['dxtrade_all_company'] == null
            ? null
            : DxtradeAllCompany.fromJson(json['dxtrade_all_company']),
        dxtradeFinancialCompany: json['dxtrade_financial_company'] == null
            ? null
            : DxtradeFinancialCompany.fromJson(
                json['dxtrade_financial_company']),
        dxtradeGamingCompany: json['dxtrade_gaming_company'] == null
            ? null
            : DxtradeGamingCompany.fromJson(json['dxtrade_gaming_company']),
        financialCompany: json['financial_company'] == null
            ? null
            : FinancialCompany.fromJson(json['financial_company']),
        forbiddenPostcodePattern: json['forbidden_postcode_pattern'],
        gamingCompany: json['gaming_company'] == null
            ? null
            : GamingCompany.fromJson(json['gaming_company']),
        gamstopCompany: json['gamstop_company'] == null
            ? null
            : List<String>.from(
                json['gamstop_company']?.map(
                  (dynamic item) => item,
                ),
              ),
        id: json['id'],
        isIdvSupported: getBool(json['is_idv_supported']),
        lcToOpenMfAccount: json['lc_to_open_mf_account'],
        minimumAge: json['minimum_age'],
        mt5AgeVerification: getBool(json['mt5_age_verification']),
        mtFinancialCompany: json['mt_financial_company'] == null
            ? null
            : MtFinancialCompany.fromJson(json['mt_financial_company']),
        mtGamingCompany: json['mt_gaming_company'] == null
            ? null
            : MtGamingCompany.fromJson(json['mt_gaming_company']),
        name: json['name'],
        needSetMaxTurnoverLimit: getBool(json['need_set_max_turnover_limit']),
        noProvince: getBool(json['no_province']),
        requireAddressPostcode: getBool(json['require_address_postcode']),
        requireAgeVerifiedForSynthetic:
            getBool(json['require_age_verified_for_synthetic']),
        requirePoi: getBool(json['require_poi']),
        requireVerificationWhenNotAgeVerified:
            getBool(json['require_verification_when_not_age_verified']),
        skipDepositVerification: getBool(json['skip_deposit_verification']),
        ukgcFundsProtection: getBool(json['ukgc_funds_protection']),
        virtualCompany: json['virtual_company'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['address_parseable'] = addressParseable;
    resultMap['config'] = config;
    if (dxtradeAllCompany != null) {
      resultMap['dxtrade_all_company'] = dxtradeAllCompany!.toJson();
    }
    if (dxtradeFinancialCompany != null) {
      resultMap['dxtrade_financial_company'] =
          dxtradeFinancialCompany!.toJson();
    }
    if (dxtradeGamingCompany != null) {
      resultMap['dxtrade_gaming_company'] = dxtradeGamingCompany!.toJson();
    }
    if (financialCompany != null) {
      resultMap['financial_company'] = financialCompany!.toJson();
    }
    resultMap['forbidden_postcode_pattern'] = forbiddenPostcodePattern;
    if (gamingCompany != null) {
      resultMap['gaming_company'] = gamingCompany!.toJson();
    }
    if (gamstopCompany != null) {
      resultMap['gamstop_company'] = gamstopCompany!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    resultMap['id'] = id;
    resultMap['is_idv_supported'] = isIdvSupported;
    resultMap['lc_to_open_mf_account'] = lcToOpenMfAccount;
    resultMap['minimum_age'] = minimumAge;
    resultMap['mt5_age_verification'] = mt5AgeVerification;
    if (mtFinancialCompany != null) {
      resultMap['mt_financial_company'] = mtFinancialCompany!.toJson();
    }
    if (mtGamingCompany != null) {
      resultMap['mt_gaming_company'] = mtGamingCompany!.toJson();
    }
    resultMap['name'] = name;
    resultMap['need_set_max_turnover_limit'] = needSetMaxTurnoverLimit;
    resultMap['no_province'] = noProvince;
    resultMap['require_address_postcode'] = requireAddressPostcode;
    resultMap['require_age_verified_for_synthetic'] =
        requireAgeVerifiedForSynthetic;
    resultMap['require_poi'] = requirePoi;
    resultMap['require_verification_when_not_age_verified'] =
        requireVerificationWhenNotAgeVerified;
    resultMap['skip_deposit_verification'] = skipDepositVerification;
    resultMap['ukgc_funds_protection'] = ukgcFundsProtection;
    resultMap['virtual_company'] = virtualCompany;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LandingCompany copyWith({
    bool? addressParseable,
    Map<String, dynamic>? config,
    DxtradeAllCompany? dxtradeAllCompany,
    DxtradeFinancialCompany? dxtradeFinancialCompany,
    DxtradeGamingCompany? dxtradeGamingCompany,
    FinancialCompany? financialCompany,
    String? forbiddenPostcodePattern,
    GamingCompany? gamingCompany,
    List<String>? gamstopCompany,
    String? id,
    bool? isIdvSupported,
    String? lcToOpenMfAccount,
    int? minimumAge,
    bool? mt5AgeVerification,
    MtFinancialCompany? mtFinancialCompany,
    MtGamingCompany? mtGamingCompany,
    String? name,
    bool? needSetMaxTurnoverLimit,
    bool? noProvince,
    bool? requireAddressPostcode,
    bool? requireAgeVerifiedForSynthetic,
    bool? requirePoi,
    bool? requireVerificationWhenNotAgeVerified,
    bool? skipDepositVerification,
    bool? ukgcFundsProtection,
    String? virtualCompany,
  }) =>
      LandingCompany(
        addressParseable: addressParseable ?? this.addressParseable,
        config: config ?? this.config,
        dxtradeAllCompany: dxtradeAllCompany ?? this.dxtradeAllCompany,
        dxtradeFinancialCompany:
            dxtradeFinancialCompany ?? this.dxtradeFinancialCompany,
        dxtradeGamingCompany: dxtradeGamingCompany ?? this.dxtradeGamingCompany,
        financialCompany: financialCompany ?? this.financialCompany,
        forbiddenPostcodePattern:
            forbiddenPostcodePattern ?? this.forbiddenPostcodePattern,
        gamingCompany: gamingCompany ?? this.gamingCompany,
        gamstopCompany: gamstopCompany ?? this.gamstopCompany,
        id: id ?? this.id,
        isIdvSupported: isIdvSupported ?? this.isIdvSupported,
        lcToOpenMfAccount: lcToOpenMfAccount ?? this.lcToOpenMfAccount,
        minimumAge: minimumAge ?? this.minimumAge,
        mt5AgeVerification: mt5AgeVerification ?? this.mt5AgeVerification,
        mtFinancialCompany: mtFinancialCompany ?? this.mtFinancialCompany,
        mtGamingCompany: mtGamingCompany ?? this.mtGamingCompany,
        name: name ?? this.name,
        needSetMaxTurnoverLimit:
            needSetMaxTurnoverLimit ?? this.needSetMaxTurnoverLimit,
        noProvince: noProvince ?? this.noProvince,
        requireAddressPostcode:
            requireAddressPostcode ?? this.requireAddressPostcode,
        requireAgeVerifiedForSynthetic: requireAgeVerifiedForSynthetic ??
            this.requireAgeVerifiedForSynthetic,
        requirePoi: requirePoi ?? this.requirePoi,
        requireVerificationWhenNotAgeVerified:
            requireVerificationWhenNotAgeVerified ??
                this.requireVerificationWhenNotAgeVerified,
        skipDepositVerification:
            skipDepositVerification ?? this.skipDepositVerification,
        ukgcFundsProtection: ukgcFundsProtection ?? this.ukgcFundsProtection,
        virtualCompany: virtualCompany ?? this.virtualCompany,
      );
}
/// Dxtrade all company model class.
abstract class DxtradeAllCompanyModel {
  /// Initializes Dxtrade all company model class .
  const DxtradeAllCompanyModel({
    this.standard,
  });

  /// Landing Company details.
  final Standard? standard;
}

/// Dxtrade all company class.
class DxtradeAllCompany extends DxtradeAllCompanyModel {
  /// Initializes Dxtrade all company class.
  const DxtradeAllCompany({
    Standard? standard,
  }) : super(
          standard: standard,
        );

  /// Creates an instance from JSON.
  factory DxtradeAllCompany.fromJson(Map<String, dynamic> json) =>
      DxtradeAllCompany(
        standard: json['standard'] == null
            ? null
            : Standard.fromJson(json['standard']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (standard != null) {
      resultMap['standard'] = standard!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DxtradeAllCompany copyWith({
    Standard? standard,
  }) =>
      DxtradeAllCompany(
        standard: standard ?? this.standard,
      );
}
/// Standard model class.
abstract class StandardModel {
  /// Initializes Standard model class .
  const StandardModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types
  final List<String>? legalAllowedContractCategories;

  /// Allowable currencies
  final List<String>? legalAllowedCurrencies;

  /// Allowable markets
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final Requirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Standard class.
class Standard extends StandardModel {
  /// Initializes Standard class.
  const Standard({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Requirements? requirements,
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
  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : Requirements.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Standard copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Requirements? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      Standard(
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
}
/// Requirements model class.
abstract class RequirementsModel {
  /// Initializes Requirements model class .
  const RequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final AfterFirstDeposit? afterFirstDeposit;

  /// Compliance requirements
  final Compliance? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Requirements class.
class Requirements extends RequirementsModel {
  /// Initializes Requirements class.
  const Requirements({
    AfterFirstDeposit? afterFirstDeposit,
    Compliance? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : AfterFirstDeposit.fromJson(json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : Compliance.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Requirements copyWith({
    AfterFirstDeposit? afterFirstDeposit,
    Compliance? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      Requirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// After first deposit model class.
abstract class AfterFirstDepositModel {
  /// Initializes After first deposit model class .
  const AfterFirstDepositModel({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// After first deposit class.
class AfterFirstDeposit extends AfterFirstDepositModel {
  /// Initializes After first deposit class.
  const AfterFirstDeposit({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory AfterFirstDeposit.fromJson(Map<String, dynamic> json) =>
      AfterFirstDeposit(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AfterFirstDeposit copyWith({
    List<String>? financialAssessment,
  }) =>
      AfterFirstDeposit(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Compliance model class.
abstract class ComplianceModel {
  /// Initializes Compliance model class .
  const ComplianceModel({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Compliance class.
class Compliance extends ComplianceModel {
  /// Initializes Compliance class.
  const Compliance({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory Compliance.fromJson(Map<String, dynamic> json) => Compliance(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Compliance copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      Compliance(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Dxtrade financial company model class.
abstract class DxtradeFinancialCompanyModel {
  /// Initializes Dxtrade financial company model class .
  const DxtradeFinancialCompanyModel({
    this.standard,
  });

  /// Landing Company details.
  final DxtradeFinancialCompanyStandard? standard;
}

/// Dxtrade financial company class.
class DxtradeFinancialCompany extends DxtradeFinancialCompanyModel {
  /// Initializes Dxtrade financial company class.
  const DxtradeFinancialCompany({
    DxtradeFinancialCompanyStandard? standard,
  }) : super(
          standard: standard,
        );

  /// Creates an instance from JSON.
  factory DxtradeFinancialCompany.fromJson(Map<String, dynamic> json) =>
      DxtradeFinancialCompany(
        standard: json['standard'] == null
            ? null
            : DxtradeFinancialCompanyStandard.fromJson(json['standard']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (standard != null) {
      resultMap['standard'] = standard!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DxtradeFinancialCompany copyWith({
    DxtradeFinancialCompanyStandard? standard,
  }) =>
      DxtradeFinancialCompany(
        standard: standard ?? this.standard,
      );
}
/// Dxtrade financial company standard model class.
abstract class DxtradeFinancialCompanyStandardModel {
  /// Initializes Dxtrade financial company standard model class .
  const DxtradeFinancialCompanyStandardModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types
  final List<String>? legalAllowedContractCategories;

  /// Allowable currencies
  final List<String>? legalAllowedCurrencies;

  /// Allowable markets
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final StandardRequirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Dxtrade financial company standard class.
class DxtradeFinancialCompanyStandard
    extends DxtradeFinancialCompanyStandardModel {
  /// Initializes Dxtrade financial company standard class.
  const DxtradeFinancialCompanyStandard({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    StandardRequirements? requirements,
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
  factory DxtradeFinancialCompanyStandard.fromJson(Map<String, dynamic> json) =>
      DxtradeFinancialCompanyStandard(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : StandardRequirements.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DxtradeFinancialCompanyStandard copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    StandardRequirements? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      DxtradeFinancialCompanyStandard(
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
}
/// Standard requirements model class.
abstract class StandardRequirementsModel {
  /// Initializes Standard requirements model class .
  const StandardRequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Standard requirements class.
class StandardRequirements extends StandardRequirementsModel {
  /// Initializes Standard requirements class.
  const StandardRequirements({
    RequirementsAfterFirstDeposit? afterFirstDeposit,
    RequirementsCompliance? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory StandardRequirements.fromJson(Map<String, dynamic> json) =>
      StandardRequirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  StandardRequirements copyWith({
    RequirementsAfterFirstDeposit? afterFirstDeposit,
    RequirementsCompliance? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      StandardRequirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit model class.
abstract class RequirementsAfterFirstDepositModel {
  /// Initializes Requirements after first deposit model class .
  const RequirementsAfterFirstDepositModel({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit class.
class RequirementsAfterFirstDeposit extends RequirementsAfterFirstDepositModel {
  /// Initializes Requirements after first deposit class.
  const RequirementsAfterFirstDeposit({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance model class.
abstract class RequirementsComplianceModel {
  /// Initializes Requirements compliance model class .
  const RequirementsComplianceModel({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance class.
class RequirementsCompliance extends RequirementsComplianceModel {
  /// Initializes Requirements compliance class.
  const RequirementsCompliance({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Dxtrade gaming company model class.
abstract class DxtradeGamingCompanyModel {
  /// Initializes Dxtrade gaming company model class .
  const DxtradeGamingCompanyModel({
    this.standard,
  });

  /// Landing Company details.
  final DxtradeGamingCompanyStandard? standard;
}

/// Dxtrade gaming company class.
class DxtradeGamingCompany extends DxtradeGamingCompanyModel {
  /// Initializes Dxtrade gaming company class.
  const DxtradeGamingCompany({
    DxtradeGamingCompanyStandard? standard,
  }) : super(
          standard: standard,
        );

  /// Creates an instance from JSON.
  factory DxtradeGamingCompany.fromJson(Map<String, dynamic> json) =>
      DxtradeGamingCompany(
        standard: json['standard'] == null
            ? null
            : DxtradeGamingCompanyStandard.fromJson(json['standard']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (standard != null) {
      resultMap['standard'] = standard!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DxtradeGamingCompany copyWith({
    DxtradeGamingCompanyStandard? standard,
  }) =>
      DxtradeGamingCompany(
        standard: standard ?? this.standard,
      );
}
/// Dxtrade gaming company standard model class.
abstract class DxtradeGamingCompanyStandardModel {
  /// Initializes Dxtrade gaming company standard model class .
  const DxtradeGamingCompanyStandardModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types
  final List<String>? legalAllowedContractCategories;

  /// Allowable currencies
  final List<String>? legalAllowedCurrencies;

  /// Allowable markets
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final StandardRequirements12? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Dxtrade gaming company standard class.
class DxtradeGamingCompanyStandard extends DxtradeGamingCompanyStandardModel {
  /// Initializes Dxtrade gaming company standard class.
  const DxtradeGamingCompanyStandard({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    StandardRequirements12? requirements,
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
  factory DxtradeGamingCompanyStandard.fromJson(Map<String, dynamic> json) =>
      DxtradeGamingCompanyStandard(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : StandardRequirements12.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DxtradeGamingCompanyStandard copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    StandardRequirements12? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      DxtradeGamingCompanyStandard(
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
}
/// Standard requirements12 model class.
abstract class StandardRequirements12Model {
  /// Initializes Standard requirements12 model class .
  const StandardRequirements12Model({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit10? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance11? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Standard requirements12 class.
class StandardRequirements12 extends StandardRequirements12Model {
  /// Initializes Standard requirements12 class.
  const StandardRequirements12({
    RequirementsAfterFirstDeposit10? afterFirstDeposit,
    RequirementsCompliance11? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory StandardRequirements12.fromJson(Map<String, dynamic> json) =>
      StandardRequirements12(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit10.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance11.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  StandardRequirements12 copyWith({
    RequirementsAfterFirstDeposit10? afterFirstDeposit,
    RequirementsCompliance11? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      StandardRequirements12(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit10 model class.
abstract class RequirementsAfterFirstDeposit10Model {
  /// Initializes Requirements after first deposit10 model class .
  const RequirementsAfterFirstDeposit10Model({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit10 class.
class RequirementsAfterFirstDeposit10
    extends RequirementsAfterFirstDeposit10Model {
  /// Initializes Requirements after first deposit10 class.
  const RequirementsAfterFirstDeposit10({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit10.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit10(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit10 copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit10(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance11 model class.
abstract class RequirementsCompliance11Model {
  /// Initializes Requirements compliance11 model class .
  const RequirementsCompliance11Model({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance11 class.
class RequirementsCompliance11 extends RequirementsCompliance11Model {
  /// Initializes Requirements compliance11 class.
  const RequirementsCompliance11({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance11.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance11(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance11 copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance11(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Financial company model class.
abstract class FinancialCompanyModel {
  /// Initializes Financial company model class .
  const FinancialCompanyModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String>? legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String>? legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final FinancialCompanyRequirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Financial company class.
class FinancialCompany extends FinancialCompanyModel {
  /// Initializes Financial company class.
  const FinancialCompany({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialCompanyRequirements? requirements,
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
  factory FinancialCompany.fromJson(Map<String, dynamic> json) =>
      FinancialCompany(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : FinancialCompanyRequirements.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialCompany copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialCompanyRequirements? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      FinancialCompany(
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
}
/// Financial company requirements model class.
abstract class FinancialCompanyRequirementsModel {
  /// Initializes Financial company requirements model class .
  const FinancialCompanyRequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit15? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance16? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Financial company requirements class.
class FinancialCompanyRequirements extends FinancialCompanyRequirementsModel {
  /// Initializes Financial company requirements class.
  const FinancialCompanyRequirements({
    RequirementsAfterFirstDeposit15? afterFirstDeposit,
    RequirementsCompliance16? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory FinancialCompanyRequirements.fromJson(Map<String, dynamic> json) =>
      FinancialCompanyRequirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit15.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance16.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialCompanyRequirements copyWith({
    RequirementsAfterFirstDeposit15? afterFirstDeposit,
    RequirementsCompliance16? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      FinancialCompanyRequirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit15 model class.
abstract class RequirementsAfterFirstDeposit15Model {
  /// Initializes Requirements after first deposit15 model class .
  const RequirementsAfterFirstDeposit15Model({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit15 class.
class RequirementsAfterFirstDeposit15
    extends RequirementsAfterFirstDeposit15Model {
  /// Initializes Requirements after first deposit15 class.
  const RequirementsAfterFirstDeposit15({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit15.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit15(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit15 copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit15(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance16 model class.
abstract class RequirementsCompliance16Model {
  /// Initializes Requirements compliance16 model class .
  const RequirementsCompliance16Model({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance16 class.
class RequirementsCompliance16 extends RequirementsCompliance16Model {
  /// Initializes Requirements compliance16 class.
  const RequirementsCompliance16({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance16.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance16(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance16 copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance16(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Gaming company model class.
abstract class GamingCompanyModel {
  /// Initializes Gaming company model class .
  const GamingCompanyModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types
  final List<String>? legalAllowedContractCategories;

  /// Allowable currencies
  final List<String>? legalAllowedCurrencies;

  /// Allowable markets
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final GamingCompanyRequirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Gaming company class.
class GamingCompany extends GamingCompanyModel {
  /// Initializes Gaming company class.
  const GamingCompany({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    GamingCompanyRequirements? requirements,
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
  factory GamingCompany.fromJson(Map<String, dynamic> json) => GamingCompany(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : GamingCompanyRequirements.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GamingCompany copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    GamingCompanyRequirements? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      GamingCompany(
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
}
/// Gaming company requirements model class.
abstract class GamingCompanyRequirementsModel {
  /// Initializes Gaming company requirements model class .
  const GamingCompanyRequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit19? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance20? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Gaming company requirements class.
class GamingCompanyRequirements extends GamingCompanyRequirementsModel {
  /// Initializes Gaming company requirements class.
  const GamingCompanyRequirements({
    RequirementsAfterFirstDeposit19? afterFirstDeposit,
    RequirementsCompliance20? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory GamingCompanyRequirements.fromJson(Map<String, dynamic> json) =>
      GamingCompanyRequirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit19.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance20.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GamingCompanyRequirements copyWith({
    RequirementsAfterFirstDeposit19? afterFirstDeposit,
    RequirementsCompliance20? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      GamingCompanyRequirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit19 model class.
abstract class RequirementsAfterFirstDeposit19Model {
  /// Initializes Requirements after first deposit19 model class .
  const RequirementsAfterFirstDeposit19Model({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit19 class.
class RequirementsAfterFirstDeposit19
    extends RequirementsAfterFirstDeposit19Model {
  /// Initializes Requirements after first deposit19 class.
  const RequirementsAfterFirstDeposit19({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit19.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit19(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit19 copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit19(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance20 model class.
abstract class RequirementsCompliance20Model {
  /// Initializes Requirements compliance20 model class .
  const RequirementsCompliance20Model({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance20 class.
class RequirementsCompliance20 extends RequirementsCompliance20Model {
  /// Initializes Requirements compliance20 class.
  const RequirementsCompliance20({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance20.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance20(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance20 copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance20(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Mt financial company model class.
abstract class MtFinancialCompanyModel {
  /// Initializes Mt financial company model class .
  const MtFinancialCompanyModel({
    this.financial,
    this.financialStp,
  });

  /// Contain details for landing company for financial subtype. The Financial account is suitable for a wide range of traders, both new and experienced. It gives you mid-range leverage and variable spreads that give you a great deal of flexibility for whatever position you wish to take in the market.
  final Financial? financial;

  /// Contain details for landing company for Financial STP subtype. The Financial STP account provides you with tight spreads, higher ticket size and offers a variety of FX pairs from majors to exotics. It is a straight through processing (STP) account with direct access to FX liquidity from various providers.
  final FinancialStp? financialStp;
}

/// Mt financial company class.
class MtFinancialCompany extends MtFinancialCompanyModel {
  /// Initializes Mt financial company class.
  const MtFinancialCompany({
    Financial? financial,
    FinancialStp? financialStp,
  }) : super(
          financial: financial,
          financialStp: financialStp,
        );

  /// Creates an instance from JSON.
  factory MtFinancialCompany.fromJson(Map<String, dynamic> json) =>
      MtFinancialCompany(
        financial: json['financial'] == null
            ? null
            : Financial.fromJson(json['financial']),
        financialStp: json['financial_stp'] == null
            ? null
            : FinancialStp.fromJson(json['financial_stp']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financial != null) {
      resultMap['financial'] = financial!.toJson();
    }
    if (financialStp != null) {
      resultMap['financial_stp'] = financialStp!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MtFinancialCompany copyWith({
    Financial? financial,
    FinancialStp? financialStp,
  }) =>
      MtFinancialCompany(
        financial: financial ?? this.financial,
        financialStp: financialStp ?? this.financialStp,
      );
}
/// Financial model class.
abstract class FinancialModel {
  /// Initializes Financial model class .
  const FinancialModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String>? legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String>? legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final FinancialRequirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Financial class.
class Financial extends FinancialModel {
  /// Initializes Financial class.
  const Financial({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialRequirements? requirements,
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
  factory Financial.fromJson(Map<String, dynamic> json) => Financial(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : FinancialRequirements.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Financial copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialRequirements? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      Financial(
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
}
/// Financial requirements model class.
abstract class FinancialRequirementsModel {
  /// Initializes Financial requirements model class .
  const FinancialRequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit23? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance24? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Financial requirements class.
class FinancialRequirements extends FinancialRequirementsModel {
  /// Initializes Financial requirements class.
  const FinancialRequirements({
    RequirementsAfterFirstDeposit23? afterFirstDeposit,
    RequirementsCompliance24? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory FinancialRequirements.fromJson(Map<String, dynamic> json) =>
      FinancialRequirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit23.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance24.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialRequirements copyWith({
    RequirementsAfterFirstDeposit23? afterFirstDeposit,
    RequirementsCompliance24? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      FinancialRequirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit23 model class.
abstract class RequirementsAfterFirstDeposit23Model {
  /// Initializes Requirements after first deposit23 model class .
  const RequirementsAfterFirstDeposit23Model({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit23 class.
class RequirementsAfterFirstDeposit23
    extends RequirementsAfterFirstDeposit23Model {
  /// Initializes Requirements after first deposit23 class.
  const RequirementsAfterFirstDeposit23({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit23.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit23(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit23 copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit23(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance24 model class.
abstract class RequirementsCompliance24Model {
  /// Initializes Requirements compliance24 model class .
  const RequirementsCompliance24Model({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance24 class.
class RequirementsCompliance24 extends RequirementsCompliance24Model {
  /// Initializes Requirements compliance24 class.
  const RequirementsCompliance24({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance24.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance24(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance24 copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance24(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Financial stp model class.
abstract class FinancialStpModel {
  /// Initializes Financial stp model class .
  const FinancialStpModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String>? legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String>? legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final FinancialStpRequirements? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Financial stp class.
class FinancialStp extends FinancialStpModel {
  /// Initializes Financial stp class.
  const FinancialStp({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialStpRequirements? requirements,
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
  factory FinancialStp.fromJson(Map<String, dynamic> json) => FinancialStp(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : FinancialStpRequirements.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialStp copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialStpRequirements? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      FinancialStp(
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
}
/// Financial stp requirements model class.
abstract class FinancialStpRequirementsModel {
  /// Initializes Financial stp requirements model class .
  const FinancialStpRequirementsModel({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit27? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance28? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Financial stp requirements class.
class FinancialStpRequirements extends FinancialStpRequirementsModel {
  /// Initializes Financial stp requirements class.
  const FinancialStpRequirements({
    RequirementsAfterFirstDeposit27? afterFirstDeposit,
    RequirementsCompliance28? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory FinancialStpRequirements.fromJson(Map<String, dynamic> json) =>
      FinancialStpRequirements(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit27.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance28.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialStpRequirements copyWith({
    RequirementsAfterFirstDeposit27? afterFirstDeposit,
    RequirementsCompliance28? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      FinancialStpRequirements(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit27 model class.
abstract class RequirementsAfterFirstDeposit27Model {
  /// Initializes Requirements after first deposit27 model class .
  const RequirementsAfterFirstDeposit27Model({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit27 class.
class RequirementsAfterFirstDeposit27
    extends RequirementsAfterFirstDeposit27Model {
  /// Initializes Requirements after first deposit27 class.
  const RequirementsAfterFirstDeposit27({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit27.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit27(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit27 copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit27(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance28 model class.
abstract class RequirementsCompliance28Model {
  /// Initializes Requirements compliance28 model class .
  const RequirementsCompliance28Model({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance28 class.
class RequirementsCompliance28 extends RequirementsCompliance28Model {
  /// Initializes Requirements compliance28 class.
  const RequirementsCompliance28({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance28.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance28(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance28 copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance28(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
/// Mt gaming company model class.
abstract class MtGamingCompanyModel {
  /// Initializes Mt gaming company model class .
  const MtGamingCompanyModel({
    this.financial,
  });

  /// Landing Company for MT5 gaming contracts (Synthetic Indices)
  final MtGamingCompanyFinancial? financial;
}

/// Mt gaming company class.
class MtGamingCompany extends MtGamingCompanyModel {
  /// Initializes Mt gaming company class.
  const MtGamingCompany({
    MtGamingCompanyFinancial? financial,
  }) : super(
          financial: financial,
        );

  /// Creates an instance from JSON.
  factory MtGamingCompany.fromJson(Map<String, dynamic> json) =>
      MtGamingCompany(
        financial: json['financial'] == null
            ? null
            : MtGamingCompanyFinancial.fromJson(json['financial']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financial != null) {
      resultMap['financial'] = financial!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MtGamingCompany copyWith({
    MtGamingCompanyFinancial? financial,
  }) =>
      MtGamingCompany(
        financial: financial ?? this.financial,
      );
}
/// Mt gaming company financial model class.
abstract class MtGamingCompanyFinancialModel {
  /// Initializes Mt gaming company financial model class .
  const MtGamingCompanyFinancialModel({
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

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

  /// The configuration of each currency.
  final Map<String, dynamic>? currencyConfig;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool? hasRealityCheck;

  /// Allowed contract types
  final List<String>? legalAllowedContractCategories;

  /// Allowable currencies
  final List<String>? legalAllowedCurrencies;

  /// Allowable markets
  final List<String>? legalAllowedMarkets;

  /// Default account currency
  final String? legalDefaultCurrency;

  /// Landing Company legal name
  final String? name;

  /// Legal requirements for the Landing Company
  final FinancialRequirements34? requirements;

  /// Landing Company short code
  final String? shortcode;

  /// Flag that indicates whether the landing company supports professional accounts or not
  final bool? supportProfessionalClient;
}

/// Mt gaming company financial class.
class MtGamingCompanyFinancial extends MtGamingCompanyFinancialModel {
  /// Initializes Mt gaming company financial class.
  const MtGamingCompanyFinancial({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialRequirements34? requirements,
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
  factory MtGamingCompanyFinancial.fromJson(Map<String, dynamic> json) =>
      MtGamingCompanyFinancial(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        changeableFields: json['changeable_fields'],
        country: json['country'],
        currencyConfig: json['currency_config'],
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
        requirements: json['requirements'] == null
            ? null
            : FinancialRequirements34.fromJson(json['requirements']),
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
    resultMap['currency_config'] = currencyConfig;
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
    if (requirements != null) {
      resultMap['requirements'] = requirements!.toJson();
    }
    resultMap['shortcode'] = shortcode;
    resultMap['support_professional_client'] = supportProfessionalClient;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MtGamingCompanyFinancial copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    Map<String, dynamic>? currencyConfig,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    FinancialRequirements34? requirements,
    String? shortcode,
    bool? supportProfessionalClient,
  }) =>
      MtGamingCompanyFinancial(
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
}
/// Financial requirements34 model class.
abstract class FinancialRequirements34Model {
  /// Initializes Financial requirements34 model class .
  const FinancialRequirements34Model({
    this.afterFirstDeposit,
    this.compliance,
    this.signup,
    this.withdrawal,
  });

  /// After first deposit requirements
  final RequirementsAfterFirstDeposit32? afterFirstDeposit;

  /// Compliance requirements
  final RequirementsCompliance33? compliance;

  /// Sign up requirements
  final List<String>? signup;

  /// Withdrawal requirements
  final List<String>? withdrawal;
}

/// Financial requirements34 class.
class FinancialRequirements34 extends FinancialRequirements34Model {
  /// Initializes Financial requirements34 class.
  const FinancialRequirements34({
    RequirementsAfterFirstDeposit32? afterFirstDeposit,
    RequirementsCompliance33? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) : super(
          afterFirstDeposit: afterFirstDeposit,
          compliance: compliance,
          signup: signup,
          withdrawal: withdrawal,
        );

  /// Creates an instance from JSON.
  factory FinancialRequirements34.fromJson(Map<String, dynamic> json) =>
      FinancialRequirements34(
        afterFirstDeposit: json['after_first_deposit'] == null
            ? null
            : RequirementsAfterFirstDeposit32.fromJson(
                json['after_first_deposit']),
        compliance: json['compliance'] == null
            ? null
            : RequirementsCompliance33.fromJson(json['compliance']),
        signup: json['signup'] == null
            ? null
            : List<String>.from(
                json['signup']?.map(
                  (dynamic item) => item,
                ),
              ),
        withdrawal: json['withdrawal'] == null
            ? null
            : List<String>.from(
                json['withdrawal']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (afterFirstDeposit != null) {
      resultMap['after_first_deposit'] = afterFirstDeposit!.toJson();
    }
    if (compliance != null) {
      resultMap['compliance'] = compliance!.toJson();
    }
    if (signup != null) {
      resultMap['signup'] = signup!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (withdrawal != null) {
      resultMap['withdrawal'] = withdrawal!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialRequirements34 copyWith({
    RequirementsAfterFirstDeposit32? afterFirstDeposit,
    RequirementsCompliance33? compliance,
    List<String>? signup,
    List<String>? withdrawal,
  }) =>
      FinancialRequirements34(
        afterFirstDeposit: afterFirstDeposit ?? this.afterFirstDeposit,
        compliance: compliance ?? this.compliance,
        signup: signup ?? this.signup,
        withdrawal: withdrawal ?? this.withdrawal,
      );
}
/// Requirements after first deposit32 model class.
abstract class RequirementsAfterFirstDeposit32Model {
  /// Initializes Requirements after first deposit32 model class .
  const RequirementsAfterFirstDeposit32Model({
    this.financialAssessment,
  });

  /// Financial assessment requirements
  final List<String>? financialAssessment;
}

/// Requirements after first deposit32 class.
class RequirementsAfterFirstDeposit32
    extends RequirementsAfterFirstDeposit32Model {
  /// Initializes Requirements after first deposit32 class.
  const RequirementsAfterFirstDeposit32({
    List<String>? financialAssessment,
  }) : super(
          financialAssessment: financialAssessment,
        );

  /// Creates an instance from JSON.
  factory RequirementsAfterFirstDeposit32.fromJson(Map<String, dynamic> json) =>
      RequirementsAfterFirstDeposit32(
        financialAssessment: json['financial_assessment'] == null
            ? null
            : List<String>.from(
                json['financial_assessment']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialAssessment != null) {
      resultMap['financial_assessment'] = financialAssessment!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsAfterFirstDeposit32 copyWith({
    List<String>? financialAssessment,
  }) =>
      RequirementsAfterFirstDeposit32(
        financialAssessment: financialAssessment ?? this.financialAssessment,
      );
}
/// Requirements compliance33 model class.
abstract class RequirementsCompliance33Model {
  /// Initializes Requirements compliance33 model class .
  const RequirementsCompliance33Model({
    this.mt5,
    this.taxInformation,
  });

  /// Compliance MT5 requirements
  final List<String>? mt5;

  /// Compliance tax information requirements
  final List<String>? taxInformation;
}

/// Requirements compliance33 class.
class RequirementsCompliance33 extends RequirementsCompliance33Model {
  /// Initializes Requirements compliance33 class.
  const RequirementsCompliance33({
    List<String>? mt5,
    List<String>? taxInformation,
  }) : super(
          mt5: mt5,
          taxInformation: taxInformation,
        );

  /// Creates an instance from JSON.
  factory RequirementsCompliance33.fromJson(Map<String, dynamic> json) =>
      RequirementsCompliance33(
        mt5: json['mt5'] == null
            ? null
            : List<String>.from(
                json['mt5']?.map(
                  (dynamic item) => item,
                ),
              ),
        taxInformation: json['tax_information'] == null
            ? null
            : List<String>.from(
                json['tax_information']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (mt5 != null) {
      resultMap['mt5'] = mt5!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (taxInformation != null) {
      resultMap['tax_information'] = taxInformation!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  RequirementsCompliance33 copyWith({
    List<String>? mt5,
    List<String>? taxInformation,
  }) =>
      RequirementsCompliance33(
        mt5: mt5 ?? this.mt5,
        taxInformation: taxInformation ?? this.taxInformation,
      );
}
