import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Financial assessment model class
abstract class FinancialAssessmentModel extends APIBaseModel {
  /// Initializes
  FinancialAssessmentModel({
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdScore,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    this.educationLevel,
    this.employmentIndustry,
    this.employmentStatus,
    this.estimatedWorth,
    this.financialInformationScore,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    this.incomeSource,
    this.netIncome,
    this.occupation,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.sourceOfWealth,
    this.totalScore,
    this.tradingScore,
  });

  /// The anticipated account turnover
  final String? accountTurnover;

  /// Binary options trading experience
  final String? binaryOptionsTradingExperience;

  /// Binary options trading frequency
  final String? binaryOptionsTradingFrequency;

  /// CFD Score
  final int? cfdScore;

  /// CFDs trading experience
  final String? cfdTradingExperience;

  /// CFDs trading frequency
  final String? cfdTradingFrequency;

  /// Level of Education
  final String? educationLevel;

  /// Industry of Employment
  final String? employmentIndustry;

  /// Employment Status
  final String? employmentStatus;

  /// Estimated Net Worth
  final String? estimatedWorth;

  /// Financial Information Score
  final int? financialInformationScore;

  /// Forex trading experience
  final String? forexTradingExperience;

  /// Forex trading frequency
  final String? forexTradingFrequency;

  /// Income Source
  final String? incomeSource;

  /// Net Annual Income
  final String? netIncome;

  /// Occupation
  final String? occupation;

  /// Trading experience in other financial instruments
  final String? otherInstrumentsTradingExperience;

  /// Trading frequency in other financial instruments
  final String? otherInstrumentsTradingFrequency;

  /// Source of wealth
  final String? sourceOfWealth;

  /// Total Score
  final int? totalScore;

  /// Trading Experience Score
  final int? tradingScore;
}
