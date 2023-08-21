/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_financial_assessment_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Set financial assessment request class.
class SetFinancialAssessmentRequest extends Request {
  /// Initialize SetFinancialAssessmentRequest.
  const SetFinancialAssessmentRequest({
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    this.educationLevel,
    this.employmentIndustry,
    this.employmentStatus,
    this.estimatedWorth,
    this.financialInformation,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    this.incomeSource,
    this.netIncome,
    this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.setFinancialAssessment = true,
    this.sourceOfWealth,
    this.tradingExperience,
    this.tradingExperienceRegulated,
    super.msgType = 'set_financial_assessment',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory SetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessmentRequest(
        accountTurnover: json['account_turnover'] as String?,
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'] as String?,
        binaryOptionsTradingFrequency:
            json['binary_options_trading_frequency'] as String?,
        cfdTradingExperience: json['cfd_trading_experience'] as String?,
        cfdTradingFrequency: json['cfd_trading_frequency'] as String?,
        educationLevel: json['education_level'] as String?,
        employmentIndustry: json['employment_industry'] as String?,
        employmentStatus: json['employment_status'] as String?,
        estimatedWorth: json['estimated_worth'] as String?,
        financialInformation:
            json['financial_information'] as Map<String, dynamic>?,
        forexTradingExperience: json['forex_trading_experience'] as String?,
        forexTradingFrequency: json['forex_trading_frequency'] as String?,
        incomeSource: json['income_source'] as String?,
        netIncome: json['net_income'] as String?,
        occupation: json['occupation'] as String?,
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'] as String?,
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'] as String?,
        setFinancialAssessment: json['set_financial_assessment'] == null
            ? null
            : json['set_financial_assessment'] == 1,
        sourceOfWealth: json['source_of_wealth'] as String?,
        tradingExperience: json['trading_experience'] as Map<String, dynamic>?,
        tradingExperienceRegulated:
            json['trading_experience_regulated'] as Map<String, dynamic>?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// [Optional] The anticipated account turnover.
  final String? accountTurnover;

  /// [Optional] Binary options trading experience.
  final String? binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  final String? binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  final String? cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  final String? cfdTradingFrequency;

  /// [Optional] Level of Education.
  final String? educationLevel;

  /// [Optional] Industry of Employment.
  final String? employmentIndustry;

  /// [Optional] Employment Status.
  final String? employmentStatus;

  /// [Optional] Estimated Net Worth.
  final String? estimatedWorth;

  /// [Optional] The financial information of a client
  final Map<String, dynamic>? financialInformation;

  /// [Optional] Forex trading experience.
  final String? forexTradingExperience;

  /// [Optional] Forex trading frequency.
  final String? forexTradingFrequency;

  /// [Optional] Income Source.
  final String? incomeSource;

  /// [Optional] Net Annual Income.
  final String? netIncome;

  /// [Optional] Occupation.
  final String? occupation;

  /// [Optional] Trading experience in other financial instruments.
  final String? otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  final String? otherInstrumentsTradingFrequency;

  /// Must be `true`
  final bool? setFinancialAssessment;

  /// [Optional] Source of wealth.
  final String? sourceOfWealth;

  /// [Optional] The trading experience of a client
  final Map<String, dynamic>? tradingExperience;

  /// [Optional] The trading experience of a `maltainvest` client
  final Map<String, dynamic>? tradingExperienceRegulated;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_turnover': accountTurnover,
        'binary_options_trading_experience': binaryOptionsTradingExperience,
        'binary_options_trading_frequency': binaryOptionsTradingFrequency,
        'cfd_trading_experience': cfdTradingExperience,
        'cfd_trading_frequency': cfdTradingFrequency,
        'education_level': educationLevel,
        'employment_industry': employmentIndustry,
        'employment_status': employmentStatus,
        'estimated_worth': estimatedWorth,
        'financial_information': financialInformation,
        'forex_trading_experience': forexTradingExperience,
        'forex_trading_frequency': forexTradingFrequency,
        'income_source': incomeSource,
        'net_income': netIncome,
        'occupation': occupation,
        'other_instruments_trading_experience':
            otherInstrumentsTradingExperience,
        'other_instruments_trading_frequency': otherInstrumentsTradingFrequency,
        'set_financial_assessment': setFinancialAssessment == null
            ? null
            : setFinancialAssessment!
                ? 1
                : 0,
        'source_of_wealth': sourceOfWealth,
        'trading_experience': tradingExperience,
        'trading_experience_regulated': tradingExperienceRegulated,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetFinancialAssessmentRequest copyWith({
    String? accountTurnover,
    String? binaryOptionsTradingExperience,
    String? binaryOptionsTradingFrequency,
    String? cfdTradingExperience,
    String? cfdTradingFrequency,
    String? educationLevel,
    String? employmentIndustry,
    String? employmentStatus,
    String? estimatedWorth,
    Map<String, dynamic>? financialInformation,
    String? forexTradingExperience,
    String? forexTradingFrequency,
    String? incomeSource,
    String? netIncome,
    String? occupation,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    bool? setFinancialAssessment,
    String? sourceOfWealth,
    Map<String, dynamic>? tradingExperience,
    Map<String, dynamic>? tradingExperienceRegulated,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      SetFinancialAssessmentRequest(
        accountTurnover: accountTurnover ?? this.accountTurnover,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdTradingExperience: cfdTradingExperience ?? this.cfdTradingExperience,
        cfdTradingFrequency: cfdTradingFrequency ?? this.cfdTradingFrequency,
        educationLevel: educationLevel ?? this.educationLevel,
        employmentIndustry: employmentIndustry ?? this.employmentIndustry,
        employmentStatus: employmentStatus ?? this.employmentStatus,
        estimatedWorth: estimatedWorth ?? this.estimatedWorth,
        financialInformation: financialInformation ?? this.financialInformation,
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
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
        tradingExperience: tradingExperience ?? this.tradingExperience,
        tradingExperienceRegulated:
            tradingExperienceRegulated ?? this.tradingExperienceRegulated,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
