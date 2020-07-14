/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_financial_assessment_send.json
// ignore_for_file: avoid_as

import 'package:meta/meta.dart';

import '../request.dart';

/// Set financial assessment request class
class SetFinancialAssessmentRequest extends Request {
  /// Initialize SetFinancialAssessmentRequest
  const SetFinancialAssessmentRequest({
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    @required this.educationLevel,
    @required this.employmentIndustry,
    this.employmentStatus,
    @required this.estimatedWorth,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    @required this.incomeSource,
    @required this.netIncome,
    @required this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.setFinancialAssessment = true,
    this.sourceOfWealth,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'set_financial_assessment',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory SetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessmentRequest(
        accountTurnover: json['account_turnover'] as String,
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'] as String,
        binaryOptionsTradingFrequency:
            json['binary_options_trading_frequency'] as String,
        cfdTradingExperience: json['cfd_trading_experience'] as String,
        cfdTradingFrequency: json['cfd_trading_frequency'] as String,
        educationLevel: json['education_level'] as String,
        employmentIndustry: json['employment_industry'] as String,
        employmentStatus: json['employment_status'] as String,
        estimatedWorth: json['estimated_worth'] as String,
        forexTradingExperience: json['forex_trading_experience'] as String,
        forexTradingFrequency: json['forex_trading_frequency'] as String,
        incomeSource: json['income_source'] as String,
        netIncome: json['net_income'] as String,
        occupation: json['occupation'] as String,
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'] as String,
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'] as String,
        setFinancialAssessment: json['set_financial_assessment'] == null
            ? null
            : json['set_financial_assessment'] == 1,
        sourceOfWealth: json['source_of_wealth'] as String,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// [Optional] The anticipated account turnover.
  final String accountTurnover;

  /// [Optional] Binary options trading experience.
  final String binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  final String binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  final String cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  final String cfdTradingFrequency;

  /// Level of Education.
  final String educationLevel;

  /// Industry of Employment.
  final String employmentIndustry;

  /// [Optional] Employment Status.
  final String employmentStatus;

  /// Estimated Net Worth.
  final String estimatedWorth;

  /// [Optional] Forex trading experience.
  final String forexTradingExperience;

  /// [Optional] Forex trading frequency.
  final String forexTradingFrequency;

  /// Income Source.
  final String incomeSource;

  /// Net Annual Income.
  final String netIncome;

  /// Occupation.
  final String occupation;

  /// [Optional] Trading experience in other financial instruments.
  final String otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  final String otherInstrumentsTradingFrequency;

  /// Must be `true`
  final bool setFinancialAssessment;

  /// [Optional] Source of wealth.
  final String sourceOfWealth;

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
            : setFinancialAssessment ? 1 : 0,
        'source_of_wealth': sourceOfWealth,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetFinancialAssessmentRequest copyWith({
    String accountTurnover,
    String binaryOptionsTradingExperience,
    String binaryOptionsTradingFrequency,
    String cfdTradingExperience,
    String cfdTradingFrequency,
    String educationLevel,
    String employmentIndustry,
    String employmentStatus,
    String estimatedWorth,
    String forexTradingExperience,
    String forexTradingFrequency,
    String incomeSource,
    String netIncome,
    String occupation,
    String otherInstrumentsTradingExperience,
    String otherInstrumentsTradingFrequency,
    bool setFinancialAssessment,
    String sourceOfWealth,
    Map<String, dynamic> passthrough,
    int reqId,
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
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
