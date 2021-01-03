import 'package:meta/meta.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';
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
    Map<String, dynamic> landingCompanyJson,
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
    this.financialCompany,
    this.gamingCompany,
    @required this.id,
    this.mtFinancialCompany,
    this.mtGamingCompany,
    @required this.name,
  });

  /// Landing Company for financial contracts (all except Synthetic Indices)
  final FinancialCompany financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final GamingCompany gamingCompany;

  /// Country code
  final String id;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices), currently divided into Financial STP, Financial (standard), and Swap-Free as subtypes.
  final MtFinancialCompany mtFinancialCompany;

  /// Landing Company for MT5 standard gaming contracts (Synthetic Indices), currently divided into Financial (standard), and Swap-Free as subtypes.
  final MtGamingCompany mtGamingCompany;

  /// Country name
  final String name;
}

/// Landing company class
class LandingCompany extends LandingCompanyModel {
  /// Initializes
  LandingCompany({
    FinancialCompany financialCompany,
    GamingCompany gamingCompany,
    @required String id,
    MtFinancialCompany mtFinancialCompany,
    MtGamingCompany mtGamingCompany,
    @required String name,
  }) : super(
          financialCompany: financialCompany,
          gamingCompany: gamingCompany,
          id: id,
          mtFinancialCompany: mtFinancialCompany,
          mtGamingCompany: mtGamingCompany,
          name: name,
        );

  /// Creates an instance from JSON
  factory LandingCompany.fromJson(Map<String, dynamic> json) => LandingCompany(
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

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (financialCompany != null) {
      resultMap['financial_company'] = financialCompany.toJson();
    }
    if (gamingCompany != null) {
      resultMap['gaming_company'] = gamingCompany.toJson();
    }
    resultMap['id'] = id;
    if (mtFinancialCompany != null) {
      resultMap['mt_financial_company'] = mtFinancialCompany.toJson();
    }
    if (mtGamingCompany != null) {
      resultMap['mt_gaming_company'] = mtGamingCompany.toJson();
    }
    resultMap['name'] = name;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LandingCompany copyWith({
    FinancialCompany financialCompany,
    GamingCompany gamingCompany,
    String id,
    MtFinancialCompany mtFinancialCompany,
    MtGamingCompany mtGamingCompany,
    String name,
  }) =>
      LandingCompany(
        financialCompany: financialCompany ?? this.financialCompany,
        gamingCompany: gamingCompany ?? this.gamingCompany,
        id: id ?? this.id,
        mtFinancialCompany: mtFinancialCompany ?? this.mtFinancialCompany,
        mtGamingCompany: mtGamingCompany ?? this.mtGamingCompany,
        name: name ?? this.name,
      );
}
/// Financial company model class
abstract class FinancialCompanyModel {
  /// Initializes
  FinancialCompanyModel({
    this.address,
    @required this.changeableFields,
    @required this.country,
    @required this.hasRealityCheck,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic> changeableFields;

  /// Landing Company country of incorporation
  final String country;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Landing Company short code
  final String shortcode;
}

/// Financial company class
class FinancialCompany extends FinancialCompanyModel {
  /// Initializes
  FinancialCompany({
    List<String> address,
    @required Map<String, dynamic> changeableFields,
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory FinancialCompany.fromJson(Map<String, dynamic> json) =>
      FinancialCompany(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
        changeableFields: json['changeable_fields'],
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  FinancialCompany copyWith({
    List<String> address,
    Map<String, dynamic> changeableFields,
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
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
/// Gaming company model class
abstract class GamingCompanyModel {
  /// Initializes
  GamingCompanyModel({
    this.address,
    @required this.changeableFields,
    @required this.country,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Special conditions for changing sensitive fields
  final Map<String, dynamic> changeableFields;

  /// Landing Company country of incorporation
  final String country;

  /// Allowed contract types
  final List<String> legalAllowedContractCategories;

  /// Allowable currencies
  final List<String> legalAllowedCurrencies;

  /// Allowable markets
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Landing Company short code
  final String shortcode;
}

/// Gaming company class
class GamingCompany extends GamingCompanyModel {
  /// Initializes
  GamingCompany({
    List<String> address,
    @required Map<String, dynamic> changeableFields,
    @required String country,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory GamingCompany.fromJson(Map<String, dynamic> json) => GamingCompany(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  GamingCompany copyWith({
    List<String> address,
    Map<String, dynamic> changeableFields,
    String country,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
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
    this.address,
    @required this.country,
    @required this.hasRealityCheck,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Landing Company country of incorporation
  final String country;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Landing Company short code
  final String shortcode;
}

/// Financial class
class Financial extends FinancialModel {
  /// Initializes
  Financial({
    List<String> address,
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory Financial.fromJson(Map<String, dynamic> json) => Financial(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Financial copyWith({
    List<String> address,
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
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
/// Financial stp model class
abstract class FinancialStpModel {
  /// Initializes
  FinancialStpModel({
    this.address,
    @required this.country,
    @required this.hasRealityCheck,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Landing Company country of incorporation
  final String country;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Landing Company short code
  final String shortcode;
}

/// Financial stp class
class FinancialStp extends FinancialStpModel {
  /// Initializes
  FinancialStp({
    List<String> address,
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory FinancialStp.fromJson(Map<String, dynamic> json) => FinancialStp(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  FinancialStp copyWith({
    List<String> address,
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
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
/// Swap free model class
abstract class SwapFreeModel {
  /// Initializes
  SwapFreeModel({
    this.address,
    @required this.country,
    @required this.hasRealityCheck,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Landing Company country of incorporation
  final String country;

  /// Flag to indicate whether reality check is applicable for this Landing Company. `true`: applicable, `false`: not applicable. The Reality Check is a feature that gives a summary of the client's trades and account balances on a regular basis throughout his session, and is a regulatory requirement for certain Landing Companies.
  final bool hasRealityCheck;

  /// Allowed contract types for this Landing Company
  final List<String> legalAllowedContractCategories;

  /// Allowed account currencies for this Landing Company
  final List<String> legalAllowedCurrencies;

  /// Allowed markets for this Landing Company
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Landing Company short code
  final String shortcode;
}

/// Swap free class
class SwapFree extends SwapFreeModel {
  /// Initializes
  SwapFree({
    List<String> address,
    @required String country,
    @required bool hasRealityCheck,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory SwapFree.fromJson(Map<String, dynamic> json) => SwapFree(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SwapFree copyWith({
    List<String> address,
    String country,
    bool hasRealityCheck,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    String shortcode,
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
/// Mt gaming company model class
abstract class MtGamingCompanyModel {
  /// Initializes
  MtGamingCompanyModel({
    this.financial,
    this.swapFree,
  });

  /// Landing Company for MT5 gaming contracts (Synthetic Indices)
  final Financial financial;

  /// Landing Company for MT5 swap free gaming contracts (Synthetic Indices)
  final SwapFree swapFree;
}

/// Mt gaming company class
class MtGamingCompany extends MtGamingCompanyModel {
  /// Initializes
  MtGamingCompany({
    Financial financial,
    SwapFree swapFree,
  }) : super(
          financial: financial,
          swapFree: swapFree,
        );

  /// Creates an instance from JSON
  factory MtGamingCompany.fromJson(Map<String, dynamic> json) =>
      MtGamingCompany(
        financial: json['financial'] == null
            ? null
            : Financial.fromJson(json['financial']),
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
    if (swapFree != null) {
      resultMap['swap_free'] = swapFree.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  MtGamingCompany copyWith({
    Financial financial,
    SwapFree swapFree,
  }) =>
      MtGamingCompany(
        financial: financial ?? this.financial,
        swapFree: swapFree ?? this.swapFree,
      );
}
/// Financial model class
abstract class FinancialModel {
  /// Initializes
  FinancialModel({
    this.address,
    @required this.country,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.requirements,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Landing Company country of incorporation
  final String country;

  /// Allowed contract types
  final List<String> legalAllowedContractCategories;

  /// Allowable currencies
  final List<String> legalAllowedCurrencies;

  /// Allowable markets
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Legal requirements for the Landing Company
  final Map<String, dynamic> requirements;

  /// Landing Company short code
  final String shortcode;
}

/// Financial class
class Financial extends FinancialModel {
  /// Initializes
  Financial({
    List<String> address,
    @required String country,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required Map<String, dynamic> requirements,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory Financial.fromJson(Map<String, dynamic> json) => Financial(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Financial copyWith({
    List<String> address,
    String country,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    Map<String, dynamic> requirements,
    String shortcode,
  }) =>
      Financial(
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
/// Swap free model class
abstract class SwapFreeModel {
  /// Initializes
  SwapFreeModel({
    this.address,
    @required this.country,
    @required this.legalAllowedContractCategories,
    @required this.legalAllowedCurrencies,
    @required this.legalAllowedMarkets,
    @required this.legalDefaultCurrency,
    @required this.name,
    @required this.requirements,
    @required this.shortcode,
  });

  /// Landing Company address
  final List<String> address;

  /// Landing Company country of incorporation
  final String country;

  /// Allowed contract types
  final List<String> legalAllowedContractCategories;

  /// Allowable currencies
  final List<String> legalAllowedCurrencies;

  /// Allowable markets
  final List<String> legalAllowedMarkets;

  /// Default account currency
  final String legalDefaultCurrency;

  /// Landing Company legal name
  final String name;

  /// Legal requirements for the Landing Company
  final Map<String, dynamic> requirements;

  /// Landing Company short code
  final String shortcode;
}

/// Swap free class
class SwapFree extends SwapFreeModel {
  /// Initializes
  SwapFree({
    List<String> address,
    @required String country,
    @required List<String> legalAllowedContractCategories,
    @required List<String> legalAllowedCurrencies,
    @required List<String> legalAllowedMarkets,
    @required String legalDefaultCurrency,
    @required String name,
    @required Map<String, dynamic> requirements,
    @required String shortcode,
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

  /// Creates an instance from JSON
  factory SwapFree.fromJson(Map<String, dynamic> json) => SwapFree(
        address: json['address'] == null
            ? null
            : List<String>.from(json['address'].map((dynamic item) => item)),
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
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (address != null) {
      resultMap['address'] =
          address.map<dynamic>((String item) => item).toList();
    }
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

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  SwapFree copyWith({
    List<String> address,
    String country,
    List<String> legalAllowedContractCategories,
    List<String> legalAllowedCurrencies,
    List<String> legalAllowedMarkets,
    String legalDefaultCurrency,
    String name,
    Map<String, dynamic> requirements,
    String shortcode,
  }) =>
      SwapFree(
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
