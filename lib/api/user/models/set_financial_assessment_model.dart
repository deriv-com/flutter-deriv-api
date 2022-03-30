import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// The financial assessment score assigned to the submitted financial assessment model
abstract class SetFinancialAssessmentModel extends APIBaseModel {
  /// Initializes
  SetFinancialAssessmentModel({
    this.cfdScore,
    this.financialInformationScore,
    this.totalScore,
    this.tradingScore,
  });

  /// CFD score based on answers
  final int? cfdScore;

  /// Financial information score based on answers
  final int? financialInformationScore;

  /// Financial Assessment score based on answers
  final int? totalScore;

  /// Trading experience score based on answers
  final int? tradingScore;
}
