import 'api_base_model.dart';

///The financial assessment score assigned to the submitted financial assessment
class SetFinancialAssessmentModel extends APIBaseModel {
  /// Initializes
  SetFinancialAssessmentModel({
    this.cfdScore,
    this.financialInformationScore,
    this.totalScore,
    this.tradingScore,
  });

  /// Generates a new instance from JSON
  factory SetFinancialAssessmentModel.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessmentModel(
        cfdScore: json['cfd_score'],
        financialInformationScore: json['financial_information_score'],
        totalScore: json['total_score'],
        tradingScore: json['trading_score'],
      );

  /// CFD score based on answers
  final int cfdScore;

  /// Financial information score based on answers
  final int financialInformationScore;

  /// Financial Assessment score based on answers
  final int totalScore;

  /// Trading experience score based on answers
  final int tradingScore;

  /// Creates a copy of instance with given parameters
  SetFinancialAssessmentModel copyWith({
    int cfdScore,
    int financialInformationScore,
    int totalScore,
    int tradingScore,
  }) =>
      SetFinancialAssessmentModel(
        cfdScore: cfdScore ?? this.cfdScore,
        financialInformationScore:
            financialInformationScore ?? this.financialInformationScore,
        totalScore: totalScore ?? this.totalScore,
        tradingScore: tradingScore ?? this.tradingScore,
      );
}
