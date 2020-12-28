/// Landing company receive model class
abstract class LandingCompanyReceiveModel {
  /// Initializes
  LandingCompanyReceiveModel({
    @required this.landingCompany,
  });

  /// Landing Company
  final LandingCompany landingCompany;
}

/// Landing company receive class
class LandingCompanyReceive extends LandingCompanyReceiveModel {
  /// Initializes
  LandingCompanyReceive({
    @required LandingCompany landingCompany,
  }) : super(
          landingCompany: landingCompany,
        );

  /// Creates an instance from JSON
  factory LandingCompanyReceive.fromJson(Map<String, dynamic> json) =>
      LandingCompanyReceive(
        landingCompany: json['landing_company'] == null
            ? null
            : LandingCompany.fromJson(json['landing_company']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (landingCompany != null) {
      result['landing_company'] = landingCompany.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  LandingCompanyReceive copyWith({
    LandingCompany landingCompany,
  }) =>
      LandingCompanyReceive(
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
  final UNKNOWN_TYPE financialCompany;

  /// Landing Company for gaming contracts (Synthetic Indices)
  final UNKNOWN_TYPE gamingCompany;

  /// Country code
  final String id;

  /// Landing Company for MT5 financial contracts (all except Synthetic Indices), currently divided into Financial STP, Financial (standard), and Swap-Free as subtypes.
  final UNKNOWN_TYPE mtFinancialCompany;

  /// Landing Company for MT5 standard gaming contracts (Synthetic Indices), currently divided into Financial (standard), and Swap-Free as subtypes.
  final UNKNOWN_TYPE mtGamingCompany;

  /// Country name
  final String name;
}

/// Landing company class
class LandingCompany extends LandingCompanyModel {
  /// Initializes
  LandingCompany({
    UNKNOWN_TYPE financialCompany,
    UNKNOWN_TYPE gamingCompany,
    @required String id,
    UNKNOWN_TYPE mtFinancialCompany,
    UNKNOWN_TYPE mtGamingCompany,
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
        financialCompany: json['financial_company'],
        gamingCompany: json['gaming_company'],
        id: json['id'],
        mtFinancialCompany: json['mt_financial_company'],
        mtGamingCompany: json['mt_gaming_company'],
        name: json['name'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['financial_company'] = financialCompany;
    result['gaming_company'] = gamingCompany;
    result['id'] = id;
    result['mt_financial_company'] = mtFinancialCompany;
    result['mt_gaming_company'] = mtGamingCompany;
    result['name'] = name;

    return result;
  }

  /// Creates a copy of instance with given parameters
  LandingCompany copyWith({
    UNKNOWN_TYPE financialCompany,
    UNKNOWN_TYPE gamingCompany,
    String id,
    UNKNOWN_TYPE mtFinancialCompany,
    UNKNOWN_TYPE mtGamingCompany,
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
