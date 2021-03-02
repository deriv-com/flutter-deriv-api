import 'package:meta/meta.dart';

import '../../basic_api/generated/landing_company_details_receive.dart';
import '../../basic_api/generated/landing_company_details_send.dart';
import '../../basic_api/generated/landing_company_receive.dart';
import '../../basic_api/generated/landing_company_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';
import 'landing_company_details_receive_result.dart';

/// Landing company response model class
abstract class LandingCompanyResponseModel {
  /// Initializes
  LandingCompanyResponseModel({
    @required this.landingCompany,
  });

  /// Landing Company
  final LandingCompany landingCompany;
}

/// Landing company response class
class LandingCompanyResponse extends LandingCompanyResponseModel {
  /// Initializes
  LandingCompanyResponse({
    @required LandingCompany landingCompany,
  }) : super(
          landingCompany: landingCompany,
        );

  /// Creates an instance from JSON
  factory LandingCompanyResponse.fromJson(
    dynamic landingCompanyJson,
  ) =>
      LandingCompanyResponse(
        landingCompany: landingCompanyJson == null
            ? null
            : LandingCompany.fromJson(landingCompanyJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (landingCompany != null) {
      resultMap['landing_company'] = landingCompany.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets landing companies for given [LandingCompanyRequest]
  ///
  /// Throws a [LandingCompanyException] if API response contains an error
  static Future<LandingCompanyResponse> fetchLandingCompanies(
    LandingCompanySend request,
  ) async {
    final LandingCompanyReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          LandingCompanyException(baseExceptionModel: baseExceptionModel),
    );

    return LandingCompanyResponse.fromJson(response.landingCompany);
  }

  /// Gets details of a landing company specified in [LandingCompanyDetailsRequest]
  ///
  /// Throws a [LandingCompanyException] if API response contains an error
  static Future<LandingCompanyDetailsResponse> fetchLandingCompanyDetails(
    LandingCompanyDetailsSend request,
  ) async {
    final LandingCompanyDetailsReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          LandingCompanyException(baseExceptionModel: baseExceptionModel),
    );

    return LandingCompanyDetailsResponse.fromJson(
        response.landingCompanyDetails);
  }

  /// Creates a copy of instance with given parameters
  LandingCompanyResponse copyWith({
    LandingCompany landingCompany,
  }) =>
      LandingCompanyResponse(
        landingCompany: landingCompany ?? this.landingCompany,
      );
}
/// Landing company model class
abstract class LandingCompanyModel {
  /// Initializes
  LandingCompanyModel({
    @required this.name,
    @required this.id,
    this.financialCompany,
    this.gamingCompany,
    this.mtFinancialCompany,
    this.mtGamingCompany,
  });

  /// Country name
  final String name;

  /// Country code
  final String id;

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final FinancialCompany financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final GamingCompany gamingCompany;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices), currently divided into Financial STP, Financial (standard), and Swap-Free as subtypes.
  final MtFinancialCompany mtFinancialCompany;

  /// Landing Company for MT5 standard gaming contracts (Synthetic Indices), currently divided into Financial (standard), and Swap-Free as subtypes.
  final MtGamingCompany mtGamingCompany;
}

/// Landing company class
class LandingCompany extends LandingCompanyModel {
  /// Initializes
  LandingCompany({
    @required String id,
    @required String name,
    FinancialCompany financialCompany,
    GamingCompany gamingCompany,
    MtFinancialCompany mtFinancialCompany,
    MtGamingCompany mtGamingCompany,
  }) : super(
          id: id,
          name: name,
          financialCompany: financialCompany,
          gamingCompany: gamingCompany,
          mtFinancialCompany: mtFinancialCompany,
          mtGamingCompany: mtGamingCompany,
        );

  /// Creates an instance from JSON
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
        id: json['id'],
        name: json['name'],
        financialCompany: json['financial_company'] == null
            ? null
            : FinancialCompany.fromJson(json['financial_company']),
        gamingCompany: json['gaming_company'] == null
            ? null
            : GamingCompany.fromJson(json['gaming_company']),
        mtFinancialCompany: json['mt_financial_company'] == null
            ? null
            : MtFinancialCompany.fromJson(json['mt_financial_company']),
        mtGamingCompany: json['mt_gaming_company'] == null
            ? null
            : MtGamingCompany.fromJson(json['mt_gaming_company']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['name'] = name;
    if (financialCompany != null) {
      resultMap['financial_company'] = financialCompany.toJson();
    }
    if (gamingCompany != null) {
      resultMap['gaming_company'] = gamingCompany.toJson();
    }
    if (mtFinancialCompany != null) {
      resultMap['mt_financial_company'] = mtFinancialCompany.toJson();
    }
    if (mtGamingCompany != null) {
      resultMap['mt_gaming_company'] = mtGamingCompany.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LandingCompany copyWith({
    String id,
    String name,
    FinancialCompany financialCompany,
    GamingCompany gamingCompany,
    MtFinancialCompany mtFinancialCompany,
    MtGamingCompany mtGamingCompany,
  }) =>
      LandingCompany(
        id: id ?? this.id,
        name: name ?? this.name,
        financialCompany: financialCompany ?? this.financialCompany,
        gamingCompany: gamingCompany ?? this.gamingCompany,
        mtFinancialCompany: mtFinancialCompany ?? this.mtFinancialCompany,
        mtGamingCompany: mtGamingCompany ?? this.mtGamingCompany,
      );
}
/// Financial company model class
abstract class FinancialCompanyModel {
  /// Initializes
  FinancialCompanyModel({
    @required this.shortcode,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.hasRealityCheck,
    @required this.country,
    @required this.changeableFields,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `1`: applicable, `0`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final int hasRealityCheck;

  /// Landing Company country of incorporation
  final String country;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic> changeableFields;

  /// Landing Company address
  final List<String> address;
}

/// Financial company class
class FinancialCompany extends FinancialCompanyModel {
  /// Initializes
  FinancialCompany({
    @required Map<String, dynamic> changeableFields,
    @required String country,
    @required int hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
    List<String> address,
  }) : super(
          changeableFields: changeableFields,
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory FinancialCompany.fromJson(Map<String, dynamic> json) =>
      FinancialCompany(
        changeableFields: json['changeable_fields'],
        country: json['country'],
        hasRealityCheck: json['has_reality_check'],
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['changeable_fields'] = changeableFields;
    resultMap['country'] = country;
    resultMap['has_reality_check'] = hasRealityCheck;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  FinancialCompany copyWith({
    Map<String, dynamic> changeableFields,
    String country,
    int hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
    List<String> address,
  }) =>
      FinancialCompany(
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
        address: address ?? this.address,
      );
}
/// Gaming company model class
abstract class GamingCompanyModel {
  /// Initializes
  GamingCompanyModel({
    @required this.shortcode,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.country,
    @required this.changeableFields,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowable markets
  final List<String> legalAllowedMarkets;

  /// Allowable currencies
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types
  final List<String> legalAllowedContractCategories;

  /// Landing Company country of incorporation
  final String country;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic> changeableFields;

  /// Landing Company address
  final List<String> address;
}

/// Gaming company class
class GamingCompany extends GamingCompanyModel {
  /// Initializes
  GamingCompany({
    @required Map<String, dynamic> changeableFields,
    @required String country,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
    List<String> address,
  }) : super(
          changeableFields: changeableFields,
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory GamingCompany.fromJson(Map<String, dynamic> json) => GamingCompany(
        changeableFields: json['changeable_fields'],
        country: json['country'],
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['changeable_fields'] = changeableFields;
    resultMap['country'] = country;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  GamingCompany copyWith({
    Map<String, dynamic> changeableFields,
    String country,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
    List<String> address,
  }) =>
      GamingCompany(
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
        address: address ?? this.address,
      );
}
/// Mt financial company model class
abstract class MtFinancialCompanyModel {
  /// Initializes
  MtFinancialCompanyModel({
    this.financial,
    this.financialStp,
    this.swapFree,
  });

  /// Contain details for landing company for financial subtype. The Financial account is suitable for a wide range of traders, both new and experienced. It gives you mid-range leverage and variable spreads that give you a great deal of flexibility for whatever position you wish to take in the market.
  final Financial financial;

  /// Contain details for landing company for Financial STP subtype. The Financial STP account provides you with tight spreads, higher ticket size and offers a variety of FX pairs from majors to exotics. It is a straight through processing (STP) account with direct access to FX liquidity from various providers.
  final FinancialStp financialStp;

  /// Contains details for Landing Company for swap-free subtype. The Swap-Free account is suitable for a wide range of traders, both new and experienced. It gives you mid-range leverage and variable spreads that give you a great deal of flexibility for whatever position you wish to take in the market with zero swap fee.
  final SwapFree swapFree;
}

/// Mt financial company class
class MtFinancialCompany extends MtFinancialCompanyModel {
  /// Initializes
  MtFinancialCompany({
    Financial financial,
    FinancialStp financialStp,
    SwapFree swapFree,
  }) : super(
          financial: financial,
          financialStp: financialStp,
          swapFree: swapFree,
        );

  /// Creates an instance from JSON
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financial != null) {
      resultMap['financial'] = financial.toJson();
    }
    if (financialStp != null) {
      resultMap['financial_stp'] = financialStp.toJson();
    }
    if (swapFree != null) {
      resultMap['swap_free'] = swapFree.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MtFinancialCompany copyWith({
    Financial financial,
    FinancialStp financialStp,
    SwapFree swapFree,
  }) =>
      MtFinancialCompany(
        financial: financial ?? this.financial,
        financialStp: financialStp ?? this.financialStp,
        swapFree: swapFree ?? this.swapFree,
      );
}
/// Financial model class
abstract class FinancialModel {
  /// Initializes
  FinancialModel({
    @required this.shortcode,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.hasRealityCheck,
    @required this.country,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Landing Company country of incorporation
  final String country;

  /// Landing Company address
  final List<String> address;
}

/// Financial class
class Financial extends FinancialModel {
  /// Initializes
  Financial({
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
    List<String> address,
  }) : super(
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory Financial.fromJson(Map<String, dynamic> json) => Financial(
        country: json['country'],
        hasRealityCheck: getBool(json['has_reality_check']),
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country'] = country;
    resultMap['has_reality_check'] = hasRealityCheck;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Financial copyWith({
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
    List<String> address,
  }) =>
      Financial(
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
        address: address ?? this.address,
      );
}
/// Financial stp model class
abstract class FinancialStpModel {
  /// Initializes
  FinancialStpModel({
    @required this.shortcode,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.hasRealityCheck,
    @required this.country,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Landing Company country of incorporation
  final String country;

  /// Landing Company address
  final List<String> address;
}

/// Financial stp class
class FinancialStp extends FinancialStpModel {
  /// Initializes
  FinancialStp({
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
    List<String> address,
  }) : super(
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory FinancialStp.fromJson(Map<String, dynamic> json) => FinancialStp(
        country: json['country'],
        hasRealityCheck: getBool(json['has_reality_check']),
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country'] = country;
    resultMap['has_reality_check'] = hasRealityCheck;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  FinancialStp copyWith({
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
    List<String> address,
  }) =>
      FinancialStp(
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
        address: address ?? this.address,
      );
}
/// Swap free model class
abstract class SwapFreeModel {
  /// Initializes
  SwapFreeModel({
    @required this.shortcode,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.hasRealityCheck,
    @required this.country,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Landing Company country of incorporation
  final String country;

  /// Landing Company address
  final List<String> address;
}

/// Swap free class
class SwapFree extends SwapFreeModel {
  /// Initializes
  SwapFree({
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
    List<String> address,
  }) : super(
          country: country,
          hasRealityCheck: hasRealityCheck,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory SwapFree.fromJson(Map<String, dynamic> json) => SwapFree(
        country: json['country'],
        hasRealityCheck: getBool(json['has_reality_check']),
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country'] = country;
    resultMap['has_reality_check'] = hasRealityCheck;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SwapFree copyWith({
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
    List<String> address,
  }) =>
      SwapFree(
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
        address: address ?? this.address,
      );
}
/// Mt gaming company model class
abstract class MtGamingCompanyModel {
  /// Initializes
  MtGamingCompanyModel({
    this.financial,
    this.swapFree,
  });

  /// Landing Company for MT5 gaming contracts (Synthetic Indices)
  final MtGamingCompanyFinancial financial;

  /// Landing Company for MT5 swap free gaming contracts (Synthetic Indices)
  final MtGamingCompanySwapFree swapFree;
}

/// Mt gaming company class
class MtGamingCompany extends MtGamingCompanyModel {
  /// Initializes
  MtGamingCompany({
    MtGamingCompanyFinancial financial,
    MtGamingCompanySwapFree swapFree,
  }) : super(
          financial: financial,
          swapFree: swapFree,
        );

  /// Creates an instance from JSON
  factory MtGamingCompany.fromJson(Map<String, dynamic> json) =>
      MtGamingCompany(
        financial: json['financial'] == null
            ? null
            : MtGamingCompanyFinancial.fromJson(json['financial']),
        swapFree: json['swap_free'] == null
            ? null
            : MtGamingCompanySwapFree.fromJson(json['swap_free']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financial != null) {
      resultMap['financial'] = financial.toJson();
    }
    if (swapFree != null) {
      resultMap['swap_free'] = swapFree.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MtGamingCompany copyWith({
    MtGamingCompanyFinancial financial,
    MtGamingCompanySwapFree swapFree,
  }) =>
      MtGamingCompany(
        financial: financial ?? this.financial,
        swapFree: swapFree ?? this.swapFree,
      );
}
/// Mt gaming company financial model class
abstract class MtGamingCompanyFinancialModel {
  /// Initializes
  MtGamingCompanyFinancialModel({
    @required this.shortcode,
    @required this.requirements,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.country,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Legal requirements for the Landing Company
  final Map<String, dynamic> requirements;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowable markets
  final List<String> legalAllowedMarkets;

  /// Allowable currencies
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types
  final List<String> legalAllowedContractCategories;

  /// Landing Company country of incorporation
  final String country;

  /// Landing Company address
  final List<String> address;
}

/// Mt gaming company financial class
class MtGamingCompanyFinancial extends MtGamingCompanyFinancialModel {
  /// Initializes
  MtGamingCompanyFinancial({
    @required String country,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required Map<String, dynamic> requirements,
    @required String shortcode,
    List<String> address,
  }) : super(
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory MtGamingCompanyFinancial.fromJson(Map<String, dynamic> json) =>
      MtGamingCompanyFinancial(
        country: json['country'],
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        requirements: json['requirements'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country'] = country;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['requirements'] = requirements;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MtGamingCompanyFinancial copyWith({
    String country,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    Map<String, dynamic> requirements,
    String shortcode,
    List<String> address,
  }) =>
      MtGamingCompanyFinancial(
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
        address: address ?? this.address,
      );
}
/// Mt gaming company swap free model class
abstract class MtGamingCompanySwapFreeModel {
  /// Initializes
  MtGamingCompanySwapFreeModel({
    @required this.shortcode,
    @required this.requirements,
    @required this.name,
    @required this.legalDefaultCurrency,
    @required this.legalAllowedMarkets,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedContractCategories,
    @required this.country,
    this.address,
  });

  /// Landing Company short code
  final String shortcode;

  /// Legal requirements for the Landing Company
  final Map<String, dynamic> requirements;

  /// Landing Company legal name
  final String name;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Allowable markets
  final List<String> legalAllowedMarkets;

  /// Allowable currencies
  final List<String> legalAllowedCurrencies;

  /// Allowed contract types
  final List<String> legalAllowedContractCategories;

  /// Landing Company country of incorporation
  final String country;

  /// Landing Company address
  final List<String> address;
}

/// Mt gaming company swap free class
class MtGamingCompanySwapFree extends MtGamingCompanySwapFreeModel {
  /// Initializes
  MtGamingCompanySwapFree({
    @required String country,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required Map<String, dynamic> requirements,
    @required String shortcode,
    List<String> address,
  }) : super(
          country: country,
          legalAllowedContractCategories: legalAllowedContractCategories,
          legalAllowedCurrencies: legalAllowedCurrencies,
          legalAllowedMarkets: legalAllowedMarkets,
          legalDefaultCurrency: legalDefaultCurrency,
          name: name,
          requirements: requirements,
          shortcode: shortcode,
          address: address,
        );

  /// Creates an instance from JSON
  factory MtGamingCompanySwapFree.fromJson(Map<String, dynamic> json) =>
      MtGamingCompanySwapFree(
        country: json['country'],
        legalAllowedContractCategories:
            json['legal_allowed_contract_categories'] == null
                ? null
                : List<String>.from(json['legal_allowed_contract_categories']
                    .map((dynamic item) => item)),
        legalAllowedCurrencies: json['legal_allowed_currencies'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_currencies'].map((dynamic item) => item)),
        legalAllowedMarkets: json['legal_allowed_markets'] == null
            ? null
            : List<String>.from(
                json['legal_allowed_markets'].map((dynamic item) => item)),
        legalDefaultCurrency: json['legal_default_currency'],
        name: json['name'],
        requirements: json['requirements'],
        shortcode: json['shortcode'],
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country'] = country;
    if (legalAllowedContractCategories != null) {
      resultMap['legal_allowed_contract_categories'] =
          legalAllowedContractCategories
              .map<dynamic>((String item) => item)
              .toList();
    }
    if (legalAllowedCurrencies != null) {
      resultMap['legal_allowed_currencies'] =
          legalAllowedCurrencies.map<dynamic>((String item) => item).toList();
    }
    if (legalAllowedMarkets != null) {
      resultMap['legal_allowed_markets'] =
          legalAllowedMarkets.map<dynamic>((String item) => item).toList();
    }
    resultMap['legal_default_currency'] = legalDefaultCurrency;
    resultMap['name'] = name;
    resultMap['requirements'] = requirements;
    resultMap['shortcode'] = shortcode;
    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MtGamingCompanySwapFree copyWith({
    String country,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    Map<String, dynamic> requirements,
    String shortcode,
    List<String> address,
  }) =>
      MtGamingCompanySwapFree(
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
        address: address ?? this.address,
      );
}
