/// Autogenerated from flutter_deriv_api|lib/api/set_financial_assessment_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'set_financial_assessment_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetFinancialAssessmentRequest {
  SetFinancialAssessmentRequest();
  factory SetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      _$SetFinancialAssessmentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SetFinancialAssessmentRequestToJson(this);

  // Properties
  int setFinancialAssessment;

  /// Must be 1
  String accountTurnover;

  /// The anticipated account turnover
  String binaryOptionsTradingExperience;

  /// Binary options trading experience
  String binaryOptionsTradingFrequency;

  /// Binary options trading frequency
  String cfdTradingExperience;

  /// CFDs trading experience
  String cfdTradingFrequency;

  /// CFDs trading frequency
  String educationLevel;

  /// Level of Education
  String employmentIndustry;

  /// Industry of Employment
  String employmentStatus;

  /// Employment Status
  String estimatedWorth;

  /// Estimated Net Worth
  String forexTradingExperience;

  /// Forex trading experience
  String forexTradingFrequency;

  /// Forex trading frequency
  String incomeSource;

  /// Income Source
  String netIncome;

  /// Net Annual Income
  String occupation;

  /// Occupation
  String otherInstrumentsTradingExperience;

  /// Trading experience in other financial instruments
  String otherInstrumentsTradingFrequency;

  /// Trading frequency in other financial instruments
  String sourceOfWealth;

  /// Source of wealth
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
