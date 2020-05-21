import 'package:flutter_deriv_api/api/user/financial_assessment/exceptions/financial_assessment_exception.dart';
import 'package:flutter_deriv_api/api/user/models/set_financial_assessment_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// The financial assessment score assigned to the submitted financial assessment
class SetFinancialAssessment extends SetFinancialAssessmentModel {
  /// Initializes
  SetFinancialAssessment({
    int cfdScore,
    int financialInformationScore,
    int totalScore,
    int tradingScore,
  }) : super(
          cfdScore: cfdScore,
          financialInformationScore: financialInformationScore,
          totalScore: totalScore,
          tradingScore: tradingScore,
        );

  /// Generates a new instance from JSON
  factory SetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessment(
        cfdScore: json['cfd_score'],
        financialInformationScore: json['financial_information_score'],
        totalScore: json['total_score'],
        tradingScore: json['trading_score'],
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  SetFinancialAssessment copyWith({
    int cfdScore,
    int financialInformationScore,
    int totalScore,
    int tradingScore,
  }) =>
      SetFinancialAssessment(
        cfdScore: cfdScore ?? this.cfdScore,
        financialInformationScore:
            financialInformationScore ?? this.financialInformationScore,
        totalScore: totalScore ?? this.totalScore,
        tradingScore: tradingScore ?? this.tradingScore,
      );

  /// Sets the financial assessment details based on the client's answers to
  /// analyze whether they possess the experience and knowledge to
  /// understand the risks involved with binary options trading.
  ///
  /// For parameters information refer to [SetFinancialAssessmentRequest].
  /// Throws a [FinancialAssessmentException] if API response contains an error
  static Future<SetFinancialAssessment> setAssessment(
    SetFinancialAssessmentRequest request,
  ) async {
    final SetFinancialAssessmentResponse response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          FinancialAssessmentException(message: message),
    );

    return SetFinancialAssessment.fromJson(response.setFinancialAssessment);
  }
}
