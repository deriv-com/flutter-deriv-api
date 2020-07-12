/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_financial_assessment_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// SetFinancialAssessmentRequest class
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
    this.setFinancialAssessment = 1,
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
        // ignore: avoid_as
        accountTurnover: json['account_turnover'] as String,
        // ignore: avoid_as
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'] as String,
        // ignore: avoid_as
        binaryOptionsTradingFrequency:
            json['binary_options_trading_frequency'] as String,
        // ignore: avoid_as
        cfdTradingExperience: json['cfd_trading_experience'] as String,
        // ignore: avoid_as
        cfdTradingFrequency: json['cfd_trading_frequency'] as String,
        // ignore: avoid_as
        educationLevel: json['education_level'] as String,
        // ignore: avoid_as
        employmentIndustry: json['employment_industry'] as String,
        // ignore: avoid_as
        employmentStatus: json['employment_status'] as String,
        // ignore: avoid_as
        estimatedWorth: json['estimated_worth'] as String,
        // ignore: avoid_as
        forexTradingExperience: json['forex_trading_experience'] as String,
        // ignore: avoid_as
        forexTradingFrequency: json['forex_trading_frequency'] as String,
        // ignore: avoid_as
        incomeSource: json['income_source'] as String,
        // ignore: avoid_as
        netIncome: json['net_income'] as String,
        // ignore: avoid_as
        occupation: json['occupation'] as String,
        // ignore: avoid_as
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'] as String,
        // ignore: avoid_as
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'] as String,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        setFinancialAssessment: json['set_financial_assessment'] as int,
        // ignore: avoid_as
        sourceOfWealth: json['source_of_wealth'] as String,
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

  /// Must be `1`
  final int setFinancialAssessment;

  /// [Optional] Source of wealth.
  final String sourceOfWealth;

  /// Converts an instance to JSON
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
        'passthrough': passthrough,
        'req_id': reqId,
        'set_financial_assessment': setFinancialAssessment,
        'source_of_wealth': sourceOfWealth,
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
    int setFinancialAssessment,
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
