import 'package:flutter_deriv_api/api/user/financial_assessment/exceptions/financial_assessment_exception.dart';
import 'package:flutter_deriv_api/api/user/models/financial_assessment_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// financial assessment class
class FinancialAssessment extends FinancialAssessmentModel {
  /// Initializes
  FinancialAssessment({
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

  /// Generate an instance from JSON
  factory FinancialAssessment.fromJson(Map<String, dynamic> json) =>
      FinancialAssessment(
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Generate a copy of instance with given parameters
  FinancialAssessment copyWith({
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
      FinancialAssessment(
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

  /// This call gets the financial assessment details.
  /// The 'financial assessment' is a questionnaire that clients of certain Landing Companies need to complete,
  /// due to regulatory and KYC (know your client) requirements.
  static Future<FinancialAssessment> getAssessment(
    GetFinancialAssessmentRequest request,
  ) async {
    final GetFinancialAssessmentResponse response =
        await _api.call(request: request);

    if (response.error != null) {
      throw FinancialAssessmentException(message: response.error['message']);
    }

    return FinancialAssessment.fromJson(response.getFinancialAssessment);
  }
}
