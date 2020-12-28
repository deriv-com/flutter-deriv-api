/// Get financial assessment receive model class
abstract class GetFinancialAssessmentReceiveModel {
  /// Initializes
  GetFinancialAssessmentReceiveModel({
    @required this.getFinancialAssessment,
  });

  /// Client's financial assessment details
  final GetFinancialAssessment getFinancialAssessment;
}

/// Get financial assessment receive class
class GetFinancialAssessmentReceive extends GetFinancialAssessmentReceiveModel {
  /// Initializes
  GetFinancialAssessmentReceive({
    @required GetFinancialAssessment getFinancialAssessment,
  }) : super(
          getFinancialAssessment: getFinancialAssessment,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessmentReceive.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessmentReceive(
        getFinancialAssessment: json['get_financial_assessment'] == null
            ? null
            : GetFinancialAssessment.fromJson(json['get_financial_assessment']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (getFinancialAssessment != null) {
      result['get_financial_assessment'] = getFinancialAssessment.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetFinancialAssessmentReceive copyWith({
    GetFinancialAssessment getFinancialAssessment,
  }) =>
      GetFinancialAssessmentReceive(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
      );
}
/// Get financial assessment model class
abstract class GetFinancialAssessmentModel {
  /// Initializes
  GetFinancialAssessmentModel({
    @required this.accountTurnover,
    @required this.binaryOptionsTradingExperience,
    @required this.binaryOptionsTradingFrequency,
    @required this.cfdScore,
    @required this.cfdTradingExperience,
    @required this.cfdTradingFrequency,
    @required this.educationLevel,
    @required this.employmentIndustry,
    @required this.employmentStatus,
    @required this.estimatedWorth,
    @required this.financialInformationScore,
    @required this.forexTradingExperience,
    @required this.forexTradingFrequency,
    @required this.incomeSource,
    @required this.netIncome,
    @required this.occupation,
    @required this.otherInstrumentsTradingExperience,
    @required this.otherInstrumentsTradingFrequency,
    @required this.sourceOfWealth,
    @required this.totalScore,
    @required this.tradingScore,
  });

  /// The anticipated account turnover
  final String accountTurnover;

  /// Binary options trading experience
  final String binaryOptionsTradingExperience;

  /// Binary options trading frequency
  final String binaryOptionsTradingFrequency;

  /// CFD Score
  final int cfdScore;

  /// CFDs trading experience
  final String cfdTradingExperience;

  /// CFDs trading frequency
  final String cfdTradingFrequency;

  /// Level of Education
  final String educationLevel;

  /// Industry of Employment
  final String employmentIndustry;

  /// Employment Status
  final String employmentStatus;

  /// Estimated Net Worth
  final String estimatedWorth;

  /// Financial Information Score
  final int financialInformationScore;

  /// Forex trading experience
  final String forexTradingExperience;

  /// Forex trading frequency
  final String forexTradingFrequency;

  /// Income Source
  final String incomeSource;

  /// Net Annual Income
  final String netIncome;

  /// Occupation
  final String occupation;

  /// Trading experience in other financial instruments
  final String otherInstrumentsTradingExperience;

  /// Trading frequency in other financial instruments
  final String otherInstrumentsTradingFrequency;

  /// Source of wealth
  final String sourceOfWealth;

  /// Total Score
  final int totalScore;

  /// Trading Experience Score
  final int tradingScore;
}

/// Get financial assessment class
class GetFinancialAssessment extends GetFinancialAssessmentModel {
  /// Initializes
  GetFinancialAssessment({
    @required String accountTurnover,
    @required String binaryOptionsTradingExperience,
    @required String binaryOptionsTradingFrequency,
    @required int cfdScore,
    @required String cfdTradingExperience,
    @required String cfdTradingFrequency,
    @required String educationLevel,
    @required String employmentIndustry,
    @required String employmentStatus,
    @required String estimatedWorth,
    @required int financialInformationScore,
    @required String forexTradingExperience,
    @required String forexTradingFrequency,
    @required String incomeSource,
    @required String netIncome,
    @required String occupation,
    @required String otherInstrumentsTradingExperience,
    @required String otherInstrumentsTradingFrequency,
    @required String sourceOfWealth,
    @required int totalScore,
    @required int tradingScore,
  }) : super(
          accountTurnover: accountTurnover,
          binaryOptionsTradingExperience: binaryOptionsTradingExperience,
          binaryOptionsTradingFrequency: binaryOptionsTradingFrequency,
          cfdScore: cfdScore,
          cfdTradingExperience: cfdTradingExperience,
          cfdTradingFrequency: cfdTradingFrequency,
          educationLevel: educationLevel,
          employmentIndustry: employmentIndustry,
          employmentStatus: employmentStatus,
          estimatedWorth: estimatedWorth,
          financialInformationScore: financialInformationScore,
          forexTradingExperience: forexTradingExperience,
          forexTradingFrequency: forexTradingFrequency,
          incomeSource: incomeSource,
          netIncome: netIncome,
          occupation: occupation,
          otherInstrumentsTradingExperience: otherInstrumentsTradingExperience,
          otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency,
          sourceOfWealth: sourceOfWealth,
          totalScore: totalScore,
          tradingScore: tradingScore,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessment(
        accountTurnover: json['account_turnover'],
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'],
        binaryOptionsTradingFrequency: json['binary_options_trading_frequency'],
        cfdScore: json['cfd_score'],
        cfdTradingExperience: json['cfd_trading_experience'],
        cfdTradingFrequency: json['cfd_trading_frequency'],
        educationLevel: json['education_level'],
        employmentIndustry: json['employment_industry'],
        employmentStatus: json['employment_status'],
        estimatedWorth: json['estimated_worth'],
        financialInformationScore: json['financial_information_score'],
        forexTradingExperience: json['forex_trading_experience'],
        forexTradingFrequency: json['forex_trading_frequency'],
        incomeSource: json['income_source'],
        netIncome: json['net_income'],
        occupation: json['occupation'],
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'],
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'],
        sourceOfWealth: json['source_of_wealth'],
        totalScore: json['total_score'],
        tradingScore: json['trading_score'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['account_turnover'] = accountTurnover;
    result['binary_options_trading_experience'] =
        binaryOptionsTradingExperience;
    result['binary_options_trading_frequency'] = binaryOptionsTradingFrequency;
    result['cfd_score'] = cfdScore;
    result['cfd_trading_experience'] = cfdTradingExperience;
    result['cfd_trading_frequency'] = cfdTradingFrequency;
    result['education_level'] = educationLevel;
    result['employment_industry'] = employmentIndustry;
    result['employment_status'] = employmentStatus;
    result['estimated_worth'] = estimatedWorth;
    result['financial_information_score'] = financialInformationScore;
    result['forex_trading_experience'] = forexTradingExperience;
    result['forex_trading_frequency'] = forexTradingFrequency;
    result['income_source'] = incomeSource;
    result['net_income'] = netIncome;
    result['occupation'] = occupation;
    result['other_instruments_trading_experience'] =
        otherInstrumentsTradingExperience;
    result['other_instruments_trading_frequency'] =
        otherInstrumentsTradingFrequency;
    result['source_of_wealth'] = sourceOfWealth;
    result['total_score'] = totalScore;
    result['trading_score'] = tradingScore;

    return result;
  }

  /// Creates a copy of instance with given parameters
  GetFinancialAssessment copyWith({
    String accountTurnover,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    int cfdScore,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    String educationLevel,
    String employmentIndustry,
    String employmentStatus,
    String estimatedWorth,
    int financialInformationScore,
    String forexTradingExperience,
    String forexTradingFrequency,
    String incomeSource,
    String netIncome,
    String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    String sourceOfWealth,
    int totalScore,
    int tradingScore,
  }) =>
      GetFinancialAssessment(
        accountTurnover: accountTurnover ?? this.accountTurnover,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdScore: cfdScore ?? this.cfdScore,
        cfdTradingExperience: cfdTradingExperience ?? this.cfdTradingExperience,
        cfdTradingFrequency: cfdTradingFrequency ?? this.cfdTradingFrequency,
        educationLevel: educationLevel ?? this.educationLevel,
        employmentIndustry: employmentIndustry ?? this.employmentIndustry,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        estimatedWorth: estimatedWorth ?? this.estimatedWorth,
        financialInformationScore:
            financialInformationScore ?? this.financialInformationScore,
        forexTradingExperience:
            forexTradingExperience ?? this.forexTradingExperience,
        forexTradingFrequency:
            forexTradingFrequency ?? this.forexTradingFrequency,
        incomeSource: incomeSource ?? this.incomeSource,
        netIncome: netIncome ?? this.netIncome,
        occupation: occupation ?? this.occupation,
        otherInstrumentsTradingExperience: otherInstrumentsTradingExperience ??
            this.otherInstrumentsTradingExperience,
        otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency ??
            this.otherInstrumentsTradingFrequency,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
        totalScore: totalScore ?? this.totalScore,
        tradingScore: tradingScore ?? this.tradingScore,
      );
}
