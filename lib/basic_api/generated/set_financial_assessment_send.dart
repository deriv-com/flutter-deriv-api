/// generated automatically from flutter_deriv_api|lib/basic_api/generated/set_financial_assessment_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'set_financial_assessment_send.g.dart';

/// JSON conversion for 'set_financial_assessment_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetFinancialAssessmentRequest extends Request {
  /// Initialize SetFinancialAssessmentRequest
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
    this.forexTradingExperience,
    this.forexTradingFrequency,
    this.incomeSource,
    this.netIncome,
    this.occupation,
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

  /// Creates instance from JSON
  factory SetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      _$SetFinancialAssessmentRequestFromJson(json);

  // Properties
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

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$SetFinancialAssessmentRequestToJson(this);

  /// Creates copy of instance with given parameters
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
