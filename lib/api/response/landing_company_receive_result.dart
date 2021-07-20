// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/response/landing_company_details_receive_result.dart';
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
  LandingCompanyResponseModel({
    this.landingCompany,
  });

  /// Landing Company
  final LandingCompany? landingCompany;
}

/// Landing company response class.
class LandingCompanyResponse extends LandingCompanyResponseModel {
  /// Initializes Landing company response class.
  LandingCompanyResponse({
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
  LandingCompanyModel({
    this.dxtradeFinancialCompany,
    this.dxtradeGamingCompany,
    this.financialCompany,
    this.gamingCompany,
    this.id,
    this.mtFinancialCompany,
    this.mtGamingCompany,
    this.name,
  });

  /// Available Deriv X financial account types (all except Synthetic Indices).
  final DxtradeFinancialCompany? dxtradeFinancialCompany;

  /// Available Deriv X gaming account types (Synthetic Indices).
  final DxtradeGamingCompany? dxtradeGamingCompany;

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final FinancialCompany? financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final GamingCompany? gamingCompany;

  /// Country code
  final String? id;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices), currently divided into Financial STP, Financial (standard), and Swap-Free as subtypes.
  final MtFinancialCompany? mtFinancialCompany;

  /// Landing Company for MT5 standard gaming contracts (Synthetic Indices), currently divided into Financial (standard), and Swap-Free as subtypes.
  final MtGamingCompany? mtGamingCompany;

  /// Country name
  final String? name;
}

/// Landing company class.
class LandingCompany extends LandingCompanyModel {
  /// Initializes Landing company class.
  LandingCompany({
    DxtradeFinancialCompany? dxtradeFinancialCompany,
    DxtradeGamingCompany? dxtradeGamingCompany,
    FinancialCompany? financialCompany,
    GamingCompany? gamingCompany,
    String? id,
    MtFinancialCompany? mtFinancialCompany,
    MtGamingCompany? mtGamingCompany,
    String? name,
  }) : super(
          dxtradeFinancialCompany: dxtradeFinancialCompany,
          dxtradeGamingCompany: dxtradeGamingCompany,
          financialCompany: financialCompany,
          gamingCompany: gamingCompany,
          id: id,
          mtFinancialCompany: mtFinancialCompany,
          mtGamingCompany: mtGamingCompany,
          name: name,
        );

  /// Creates an instance from JSON.
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
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
        gamingCompany: json['gaming_company'] == null
            ? null
            : GamingCompany.fromJson(json['gaming_company']),
        id: json['id'],
        mtFinancialCompany: json['mt_financial_company'] == null
            ? null
            : MtFinancialCompany.fromJson(json['mt_financial_company']),
        mtGamingCompany: json['mt_gaming_company'] == null
            ? null
            : MtGamingCompany.fromJson(json['mt_gaming_company']),
        name: json['name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

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
    if (gamingCompany != null) {
      resultMap['gaming_company'] = gamingCompany!.toJson();
    }
    resultMap['id'] = id;
    if (mtFinancialCompany != null) {
      resultMap['mt_financial_company'] = mtFinancialCompany!.toJson();
    }
    if (mtGamingCompany != null) {
      resultMap['mt_gaming_company'] = mtGamingCompany!.toJson();
    }
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  LandingCompany copyWith({
    DxtradeFinancialCompany? dxtradeFinancialCompany,
    DxtradeGamingCompany? dxtradeGamingCompany,
    FinancialCompany? financialCompany,
    GamingCompany? gamingCompany,
    String? id,
    MtFinancialCompany? mtFinancialCompany,
    MtGamingCompany? mtGamingCompany,
    String? name,
  }) =>
      LandingCompany(
        dxtradeFinancialCompany:
            dxtradeFinancialCompany ?? this.dxtradeFinancialCompany,
        dxtradeGamingCompany: dxtradeGamingCompany ?? this.dxtradeGamingCompany,
        financialCompany: financialCompany ?? this.financialCompany,
        gamingCompany: gamingCompany ?? this.gamingCompany,
        id: id ?? this.id,
        mtFinancialCompany: mtFinancialCompany ?? this.mtFinancialCompany,
        mtGamingCompany: mtGamingCompany ?? this.mtGamingCompany,
        name: name ?? this.name,
      );
}
/// Dxtrade financial company model class.
abstract class DxtradeFinancialCompanyModel {
  /// Initializes Dxtrade financial company model class .
  DxtradeFinancialCompanyModel({
    this.standard,
  });

  /// Landing Company details.
  final Standard? standard;
}

/// Dxtrade financial company class.
class DxtradeFinancialCompany extends DxtradeFinancialCompanyModel {
  /// Initializes Dxtrade financial company class.
  DxtradeFinancialCompany({
    Standard? standard,
  }) : super(
          standard: standard,
        );

  /// Creates an instance from JSON.
  factory DxtradeFinancialCompany.fromJson(Map<String, dynamic> json) =>
      DxtradeFinancialCompany(
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
  DxtradeFinancialCompany copyWith({
    Standard? standard,
  }) =>
      DxtradeFinancialCompany(
        standard: standard ?? this.standard,
      );
}
/// Standard model class.
abstract class StandardModel {
  /// Initializes Standard model class .
  StandardModel({
    this.address,
    this.country,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.requirements,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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
  final Map<String, dynamic>? requirements;

  /// Landing Company short code
  final String? shortcode;
}

/// Standard class.
class Standard extends StandardModel {
  /// Initializes Standard class.
  Standard({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
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
        country: json['country'],
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
    resultMap['country'] = country;
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
  Standard copyWith({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) =>
      Standard(
        address: address ?? this.address,
        country: country ?? this.country,
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
/// Dxtrade gaming company model class.
abstract class DxtradeGamingCompanyModel {
  /// Initializes Dxtrade gaming company model class .
  DxtradeGamingCompanyModel({
    this.standard,
  });

  /// Landing Company details.
  final DxtradeGamingCompanyStandard? standard;
}

/// Dxtrade gaming company class.
class DxtradeGamingCompany extends DxtradeGamingCompanyModel {
  /// Initializes Dxtrade gaming company class.
  DxtradeGamingCompany({
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
  DxtradeGamingCompanyStandardModel({
    this.address,
    this.country,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.requirements,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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
  final Map<String, dynamic>? requirements;

  /// Landing Company short code
  final String? shortcode;
}

/// Dxtrade gaming company standard class.
class DxtradeGamingCompanyStandard extends DxtradeGamingCompanyStandardModel {
  /// Initializes Dxtrade gaming company standard class.
  DxtradeGamingCompanyStandard({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
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
        country: json['country'],
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
    resultMap['country'] = country;
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
  DxtradeGamingCompanyStandard copyWith({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) =>
      DxtradeGamingCompanyStandard(
        address: address ?? this.address,
        country: country ?? this.country,
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
/// Financial company model class.
abstract class FinancialCompanyModel {
  /// Initializes Financial company model class .
  FinancialCompanyModel({
    this.address,
    this.changeableFields,
    this.country,
    this.hasRealityCheck,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

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

  /// Landing Company short code
  final String? shortcode;
}

/// Financial company class.
class FinancialCompany extends FinancialCompanyModel {
  /// Initializes Financial company class.
  FinancialCompany({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) : super(
          address: address,
          changeableFields: changeableFields,
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
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
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialCompany copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) =>
      FinancialCompany(
        address: address ?? this.address,
        changeableFields: changeableFields ?? this.changeableFields,
        country: country ?? this.country,
        hasRealityCheck: hasRealityCheck ?? this.hasRealityCheck,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        shortcode: shortcode ?? this.shortcode,
      );
}
/// Gaming company model class.
abstract class GamingCompanyModel {
  /// Initializes Gaming company model class .
  GamingCompanyModel({
    this.address,
    this.changeableFields,
    this.country,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic>? changeableFields;

  /// Landing Company country of incorporation
  final String? country;

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

  /// Landing Company short code
  final String? shortcode;
}

/// Gaming company class.
class GamingCompany extends GamingCompanyModel {
  /// Initializes Gaming company class.
  GamingCompany({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) : super(
          address: address,
          changeableFields: changeableFields,
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
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
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GamingCompany copyWith({
    List<String>? address,
    Map<String, dynamic>? changeableFields,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) =>
      GamingCompany(
        address: address ?? this.address,
        changeableFields: changeableFields ?? this.changeableFields,
        country: country ?? this.country,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        shortcode: shortcode ?? this.shortcode,
      );
}
/// Mt financial company model class.
abstract class MtFinancialCompanyModel {
  /// Initializes Mt financial company model class .
  MtFinancialCompanyModel({
    this.financial,
    this.financialStp,
    this.swapFree,
  });

  /// Contain details for landing company for financial subtype. The Financial account is suitable for a wide range of traders, both new and experienced. It gives you mid-range leverage and variable spreads that give you a great deal of flexibility for whatever position you wish to take in the market.
  final Financial? financial;

  /// Contain details for landing company for Financial STP subtype. The Financial STP account provides you with tight spreads, higher ticket size and offers a variety of FX pairs from majors to exotics. It is a straight through processing (STP) account with direct access to FX liquidity from various providers.
  final FinancialStp? financialStp;

  /// Contains details for Landing Company for swap-free subtype. The Swap-Free account is suitable for a wide range of traders, both new and experienced. It gives you mid-range leverage and variable spreads that give you a great deal of flexibility for whatever position you wish to take in the market with zero swap fee.
  final SwapFree? swapFree;
}

/// Mt financial company class.
class MtFinancialCompany extends MtFinancialCompanyModel {
  /// Initializes Mt financial company class.
  MtFinancialCompany({
    Financial? financial,
    FinancialStp? financialStp,
    SwapFree? swapFree,
  }) : super(
          financial: financial,
          financialStp: financialStp,
          swapFree: swapFree,
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
        swapFree: json['swap_free'] == null
            ? null
            : SwapFree.fromJson(json['swap_free']),
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
    if (swapFree != null) {
      resultMap['swap_free'] = swapFree!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MtFinancialCompany copyWith({
    Financial? financial,
    FinancialStp? financialStp,
    SwapFree? swapFree,
  }) =>
      MtFinancialCompany(
        financial: financial ?? this.financial,
        financialStp: financialStp ?? this.financialStp,
        swapFree: swapFree ?? this.swapFree,
      );
}
/// Financial model class.
abstract class FinancialModel {
  /// Initializes Financial model class .
  FinancialModel({
    this.address,
    this.country,
    this.hasRealityCheck,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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

  /// Landing Company short code
  final String? shortcode;
}

/// Financial class.
class Financial extends FinancialModel {
  /// Initializes Financial class.
  Financial({
    List<String>? address,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
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
        country: json['country'],
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
    resultMap['country'] = country;
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
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Financial copyWith({
    List<String>? address,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) =>
      Financial(
        address: address ?? this.address,
        country: country ?? this.country,
        hasRealityCheck: hasRealityCheck ?? this.hasRealityCheck,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        shortcode: shortcode ?? this.shortcode,
      );
}
/// Financial stp model class.
abstract class FinancialStpModel {
  /// Initializes Financial stp model class .
  FinancialStpModel({
    this.address,
    this.country,
    this.hasRealityCheck,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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

  /// Landing Company short code
  final String? shortcode;
}

/// Financial stp class.
class FinancialStp extends FinancialStpModel {
  /// Initializes Financial stp class.
  FinancialStp({
    List<String>? address,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
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
        country: json['country'],
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
    resultMap['country'] = country;
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
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FinancialStp copyWith({
    List<String>? address,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) =>
      FinancialStp(
        address: address ?? this.address,
        country: country ?? this.country,
        hasRealityCheck: hasRealityCheck ?? this.hasRealityCheck,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        shortcode: shortcode ?? this.shortcode,
      );
}
/// Swap free model class.
abstract class SwapFreeModel {
  /// Initializes Swap free model class .
  SwapFreeModel({
    this.address,
    this.country,
    this.hasRealityCheck,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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

  /// Landing Company short code
  final String? shortcode;
}

/// Swap free class.
class SwapFree extends SwapFreeModel {
  /// Initializes Swap free class.
  SwapFree({
    List<String>? address,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
        );

  /// Creates an instance from JSON.
  factory SwapFree.fromJson(Map<String, dynamic> json) => SwapFree(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        country: json['country'],
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
    resultMap['country'] = country;
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
    resultMap['shortcode'] = shortcode;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SwapFree copyWith({
    List<String>? address,
    String? country,
    bool? hasRealityCheck,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    String? shortcode,
  }) =>
      SwapFree(
        address: address ?? this.address,
        country: country ?? this.country,
        hasRealityCheck: hasRealityCheck ?? this.hasRealityCheck,
        legalAllowedContractCategories: legalAllowedContractCategories ??
            this.legalAllowedContractCategories,
        legalAllowedCurrencies:
            legalAllowedCurrencies ?? this.legalAllowedCurrencies,
        legalAllowedMarkets: legalAllowedMarkets ?? this.legalAllowedMarkets,
        legalDefaultCurrency: legalDefaultCurrency ?? this.legalDefaultCurrency,
        name: name ?? this.name,
        shortcode: shortcode ?? this.shortcode,
      );
}
/// Mt gaming company model class.
abstract class MtGamingCompanyModel {
  /// Initializes Mt gaming company model class .
  MtGamingCompanyModel({
    this.financial,
    this.swapFree,
  });

  /// Landing Company for MT5 gaming contracts (Synthetic Indices)
  final MtGamingCompanyFinancial? financial;

  /// Landing Company for MT5 swap free gaming contracts (Synthetic Indices)
  final MtGamingCompanySwapFree? swapFree;
}

/// Mt gaming company class.
class MtGamingCompany extends MtGamingCompanyModel {
  /// Initializes Mt gaming company class.
  MtGamingCompany({
    MtGamingCompanyFinancial? financial,
    MtGamingCompanySwapFree? swapFree,
  }) : super(
          financial: financial,
          swapFree: swapFree,
        );

  /// Creates an instance from JSON.
  factory MtGamingCompany.fromJson(Map<String, dynamic> json) =>
      MtGamingCompany(
        financial: json['financial'] == null
            ? null
            : MtGamingCompanyFinancial.fromJson(json['financial']),
        swapFree: json['swap_free'] == null
            ? null
            : MtGamingCompanySwapFree.fromJson(json['swap_free']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financial != null) {
      resultMap['financial'] = financial!.toJson();
    }
    if (swapFree != null) {
      resultMap['swap_free'] = swapFree!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  MtGamingCompany copyWith({
    MtGamingCompanyFinancial? financial,
    MtGamingCompanySwapFree? swapFree,
  }) =>
      MtGamingCompany(
        financial: financial ?? this.financial,
        swapFree: swapFree ?? this.swapFree,
      );
}
/// Mt gaming company financial model class.
abstract class MtGamingCompanyFinancialModel {
  /// Initializes Mt gaming company financial model class .
  MtGamingCompanyFinancialModel({
    this.address,
    this.country,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.requirements,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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
  final Map<String, dynamic>? requirements;

  /// Landing Company short code
  final String? shortcode;
}

/// Mt gaming company financial class.
class MtGamingCompanyFinancial extends MtGamingCompanyFinancialModel {
  /// Initializes Mt gaming company financial class.
  MtGamingCompanyFinancial({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
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
        country: json['country'],
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
    resultMap['country'] = country;
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
  MtGamingCompanyFinancial copyWith({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) =>
      MtGamingCompanyFinancial(
        address: address ?? this.address,
        country: country ?? this.country,
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
/// Mt gaming company swap free model class.
abstract class MtGamingCompanySwapFreeModel {
  /// Initializes Mt gaming company swap free model class .
  MtGamingCompanySwapFreeModel({
    this.address,
    this.country,
    this.legalAllowedContractCategories,
    this.legalAllowedCurrencies,
    this.legalAllowedMarkets,
    this.legalDefaultCurrency,
    this.name,
    this.requirements,
    this.shortcode,
  });

  /// Landing Company address
  final List<String>? address;

  /// Landing Company country of incorporation
  final String? country;

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
  final Map<String, dynamic>? requirements;

  /// Landing Company short code
  final String? shortcode;
}

/// Mt gaming company swap free class.
class MtGamingCompanySwapFree extends MtGamingCompanySwapFreeModel {
  /// Initializes Mt gaming company swap free class.
  MtGamingCompanySwapFree({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) : super(
          address: address,
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
        );

  /// Creates an instance from JSON.
  factory MtGamingCompanySwapFree.fromJson(Map<String, dynamic> json) =>
      MtGamingCompanySwapFree(
        address: json['address'] == null
            ? null
            : List<String>.from(
                json['address']?.map(
                  (dynamic item) => item,
                ),
              ),
        country: json['country'],
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
    resultMap['country'] = country;
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
  MtGamingCompanySwapFree copyWith({
    List<String>? address,
    String? country,
    List<String>? legalAllowedContractCategories,
    List<String>? legalAllowedCurrencies,
    List<String>? legalAllowedMarkets,
    String? legalDefaultCurrency,
    String? name,
    Map<String, dynamic>? requirements,
    String? shortcode,
  }) =>
      MtGamingCompanySwapFree(
        address: address ?? this.address,
        country: country ?? this.country,
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
