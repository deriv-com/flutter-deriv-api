// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// Get financial assessment response model class.
abstract class GetFinancialAssessmentResponseModel {
  /// Initializes Get financial assessment response model class .
  const GetFinancialAssessmentResponseModel({
    this.getFinancialAssessment,
  });

  /// Client's financial assessment details
  final GetFinancialAssessment? getFinancialAssessment;
}

/// Get financial assessment response class.
class GetFinancialAssessmentResponse
    extends GetFinancialAssessmentResponseModel {
  /// Initializes Get financial assessment response class.
  const GetFinancialAssessmentResponse({
    super.getFinancialAssessment,
  });

  /// Creates an instance from JSON.
  factory GetFinancialAssessmentResponse.fromJson(
    dynamic getFinancialAssessmentJson,
  ) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment: getFinancialAssessmentJson == null
            ? null
            : GetFinancialAssessment.fromJson(getFinancialAssessmentJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (getFinancialAssessment != null) {
      resultMap['get_financial_assessment'] = getFinancialAssessment!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the financial assessment details.
  ///
  /// The 'financial assessment' is a questionnaire that clients of certain Landing Companies need to complete,
  /// due to regulatory and KYC (know your client) requirements.
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<GetFinancialAssessmentResponse> fetchAssessment(
    GetFinancialAssessmentRequest request,
  ) async {
    final GetFinancialAssessmentReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return GetFinancialAssessmentResponse.fromJson(
        response.getFinancialAssessment);
  }

  /// Creates a copy of instance with given parameters.
  GetFinancialAssessmentResponse copyWith({
    GetFinancialAssessment? getFinancialAssessment,
  }) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
      );
}
/// Get financial assessment model class.
abstract class GetFinancialAssessmentModel {
  /// Initializes Get financial assessment model class .
  const GetFinancialAssessmentModel({
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdExperience,
    this.cfdFrequency,
    this.cfdScore,
    this.cfdTradingDefinition,
    this.cfdTradingExperience,
    this.cfdTradingFrequency,
    this.commoditiesTradingExperience,
    this.commoditiesTradingFrequency,
    this.educationLevel,
    this.employmentIndustry,
    this.employmentStatus,
    this.estimatedWorth,
    this.financialInformationScore,
    this.forexTradingExperience,
    this.forexTradingFrequency,
    this.incomeSource,
    this.indicesTradingExperience,
    this.indicesTradingFrequency,
    this.leverageImpactTrading,
    this.leverageTradingHighRiskStopLoss,
    this.netIncome,
    this.occupation,
    this.otherDerivativesTradingExperience,
    this.otherDerivativesTradingFrequency,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.requiredInitialMargin,
    this.riskTolerance,
    this.sourceOfExperience,
    this.sourceOfWealth,
    this.stocksTradingExperience,
    this.stocksTradingFrequency,
    this.totalScore,
    this.tradingExperienceFinancialInstruments,
    this.tradingFrequencyFinancialInstruments,
    this.tradingScore,
  });

  /// The anticipated account turnover
  final String? accountTurnover;

  /// Binary options trading experience
  final String? binaryOptionsTradingExperience;

  /// Binary options trading frequency
  final String? binaryOptionsTradingFrequency;

  /// How much experience do you have in CFD trading?
  final String? cfdExperience;

  /// How many CFD trades have you placed in the past 12 months?
  final String? cfdFrequency;

  /// CFD Score
  final int? cfdScore;

  /// In your understanding, CFD trading allows you to:
  final String? cfdTradingDefinition;

  /// CFDs trading experience
  final String? cfdTradingExperience;

  /// CFDs trading frequency
  final String? cfdTradingFrequency;

  /// Commodities trading experience
  final String? commoditiesTradingExperience;

  /// Commodities trading frequency
  final String? commoditiesTradingFrequency;

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

  /// Indices trading experience
  final String? indicesTradingExperience;

  /// Indices trading frequency
  final String? indicesTradingFrequency;

  /// How does leverage affect CFD trading?
  final String? leverageImpactTrading;

  /// Leverage trading is high-risk, so it's a good idea to use risk management features such as stop loss. Stop loss allows you to
  final String? leverageTradingHighRiskStopLoss;

  /// Net Annual Income
  final String? netIncome;

  /// Occupation
  final String? occupation;

  /// Trading experience in other financial derivatives
  final String? otherDerivativesTradingExperience;

  /// Trading frequency in other financial derivatives
  final String? otherDerivativesTradingFrequency;

  /// Trading experience in other financial instruments
  final String? otherInstrumentsTradingExperience;

  /// Trading frequency in other financial instruments
  final String? otherInstrumentsTradingFrequency;

  /// When would you be required to pay an initial margin?
  final String? requiredInitialMargin;

  /// Do you understand that you could potentially lose 100% of the money you use to trade?
  final String? riskTolerance;

  /// How much knowledge and experience do you have in relation to online trading?
  final String? sourceOfExperience;

  /// Source of wealth
  final String? sourceOfWealth;

  /// Stocks trading experience
  final String? stocksTradingExperience;

  /// Stocks trading frequency
  final String? stocksTradingFrequency;

  /// Total Score
  final int? totalScore;

  /// How much experience do you have with other financial instruments?
  final String? tradingExperienceFinancialInstruments;

  /// How many trades have you placed with other financial instruments in the past 12 months?
  final String? tradingFrequencyFinancialInstruments;

  /// Trading Experience Score
  final int? tradingScore;
}

/// Get financial assessment class.
class GetFinancialAssessment extends GetFinancialAssessmentModel {
  /// Initializes Get financial assessment class.
  const GetFinancialAssessment({
    super.accountTurnover,
    super.binaryOptionsTradingExperience,
    super.binaryOptionsTradingFrequency,
    super.cfdExperience,
    super.cfdFrequency,
    super.cfdScore,
    super.cfdTradingDefinition,
    super.cfdTradingExperience,
    super.cfdTradingFrequency,
    super.commoditiesTradingExperience,
    super.commoditiesTradingFrequency,
    super.educationLevel,
    super.employmentIndustry,
    super.employmentStatus,
    super.estimatedWorth,
    super.financialInformationScore,
    super.forexTradingExperience,
    super.forexTradingFrequency,
    super.incomeSource,
    super.indicesTradingExperience,
    super.indicesTradingFrequency,
    super.leverageImpactTrading,
    super.leverageTradingHighRiskStopLoss,
    super.netIncome,
    super.occupation,
    super.otherDerivativesTradingExperience,
    super.otherDerivativesTradingFrequency,
    super.otherInstrumentsTradingExperience,
    super.otherInstrumentsTradingFrequency,
    super.requiredInitialMargin,
    super.riskTolerance,
    super.sourceOfExperience,
    super.sourceOfWealth,
    super.stocksTradingExperience,
    super.stocksTradingFrequency,
    super.totalScore,
    super.tradingExperienceFinancialInstruments,
    super.tradingFrequencyFinancialInstruments,
    super.tradingScore,
  });

  /// Creates an instance from JSON.
  factory GetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessment(
        accountTurnover: json['account_turnover'],
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'],
        binaryOptionsTradingFrequency: json['binary_options_trading_frequency'],
        cfdExperience: json['cfd_experience'],
        cfdFrequency: json['cfd_frequency'],
        cfdScore: json['cfd_score'],
        cfdTradingDefinition: json['cfd_trading_definition'],
        cfdTradingExperience: json['cfd_trading_experience'],
        cfdTradingFrequency: json['cfd_trading_frequency'],
        commoditiesTradingExperience: json['commodities_trading_experience'],
        commoditiesTradingFrequency: json['commodities_trading_frequency'],
        educationLevel: json['education_level'],
        employmentIndustry: json['employment_industry'],
        employmentStatus: json['employment_status'],
        estimatedWorth: json['estimated_worth'],
        financialInformationScore: json['financial_information_score'],
        forexTradingExperience: json['forex_trading_experience'],
        forexTradingFrequency: json['forex_trading_frequency'],
        incomeSource: json['income_source'],
        indicesTradingExperience: json['indices_trading_experience'],
        indicesTradingFrequency: json['indices_trading_frequency'],
        leverageImpactTrading: json['leverage_impact_trading'],
        leverageTradingHighRiskStopLoss:
            json['leverage_trading_high_risk_stop_loss'],
        netIncome: json['net_income'],
        occupation: json['occupation'],
        otherDerivativesTradingExperience:
            json['other_derivatives_trading_experience'],
        otherDerivativesTradingFrequency:
            json['other_derivatives_trading_frequency'],
        otherInstrumentsTradingExperience:
            json['other_instruments_trading_experience'],
        otherInstrumentsTradingFrequency:
            json['other_instruments_trading_frequency'],
        requiredInitialMargin: json['required_initial_margin'],
        riskTolerance: json['risk_tolerance'],
        sourceOfExperience: json['source_of_experience'],
        sourceOfWealth: json['source_of_wealth'],
        stocksTradingExperience: json['stocks_trading_experience'],
        stocksTradingFrequency: json['stocks_trading_frequency'],
        totalScore: json['total_score'],
        tradingExperienceFinancialInstruments:
            json['trading_experience_financial_instruments'],
        tradingFrequencyFinancialInstruments:
            json['trading_frequency_financial_instruments'],
        tradingScore: json['trading_score'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_turnover'] = accountTurnover;
    resultMap['binary_options_trading_experience'] =
        binaryOptionsTradingExperience;
    resultMap['binary_options_trading_frequency'] =
        binaryOptionsTradingFrequency;
    resultMap['cfd_experience'] = cfdExperience;
    resultMap['cfd_frequency'] = cfdFrequency;
    resultMap['cfd_score'] = cfdScore;
    resultMap['cfd_trading_definition'] = cfdTradingDefinition;
    resultMap['cfd_trading_experience'] = cfdTradingExperience;
    resultMap['cfd_trading_frequency'] = cfdTradingFrequency;
    resultMap['commodities_trading_experience'] = commoditiesTradingExperience;
    resultMap['commodities_trading_frequency'] = commoditiesTradingFrequency;
    resultMap['education_level'] = educationLevel;
    resultMap['employment_industry'] = employmentIndustry;
    resultMap['employment_status'] = employmentStatus;
    resultMap['estimated_worth'] = estimatedWorth;
    resultMap['financial_information_score'] = financialInformationScore;
    resultMap['forex_trading_experience'] = forexTradingExperience;
    resultMap['forex_trading_frequency'] = forexTradingFrequency;
    resultMap['income_source'] = incomeSource;
    resultMap['indices_trading_experience'] = indicesTradingExperience;
    resultMap['indices_trading_frequency'] = indicesTradingFrequency;
    resultMap['leverage_impact_trading'] = leverageImpactTrading;
    resultMap['leverage_trading_high_risk_stop_loss'] =
        leverageTradingHighRiskStopLoss;
    resultMap['net_income'] = netIncome;
    resultMap['occupation'] = occupation;
    resultMap['other_derivatives_trading_experience'] =
        otherDerivativesTradingExperience;
    resultMap['other_derivatives_trading_frequency'] =
        otherDerivativesTradingFrequency;
    resultMap['other_instruments_trading_experience'] =
        otherInstrumentsTradingExperience;
    resultMap['other_instruments_trading_frequency'] =
        otherInstrumentsTradingFrequency;
    resultMap['required_initial_margin'] = requiredInitialMargin;
    resultMap['risk_tolerance'] = riskTolerance;
    resultMap['source_of_experience'] = sourceOfExperience;
    resultMap['source_of_wealth'] = sourceOfWealth;
    resultMap['stocks_trading_experience'] = stocksTradingExperience;
    resultMap['stocks_trading_frequency'] = stocksTradingFrequency;
    resultMap['total_score'] = totalScore;
    resultMap['trading_experience_financial_instruments'] =
        tradingExperienceFinancialInstruments;
    resultMap['trading_frequency_financial_instruments'] =
        tradingFrequencyFinancialInstruments;
    resultMap['trading_score'] = tradingScore;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetFinancialAssessment copyWith({
    String? accountTurnover,
    String? binaryOptionsTradingExperience,
    String? binaryOptionsTradingFrequency,
    String? cfdExperience,
    String? cfdFrequency,
    int? cfdScore,
    String? cfdTradingDefinition,
    String? cfdTradingExperience,
    String? cfdTradingFrequency,
    String? commoditiesTradingExperience,
    String? commoditiesTradingFrequency,
    String? educationLevel,
    String? employmentIndustry,
    String? employmentStatus,
    String? estimatedWorth,
    int? financialInformationScore,
    String? forexTradingExperience,
    String? forexTradingFrequency,
    String? incomeSource,
    String? indicesTradingExperience,
    String? indicesTradingFrequency,
    String? leverageImpactTrading,
    String? leverageTradingHighRiskStopLoss,
    String? netIncome,
    String? occupation,
    String? otherDerivativesTradingExperience,
    String? otherDerivativesTradingFrequency,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    String? requiredInitialMargin,
    String? riskTolerance,
    String? sourceOfExperience,
    String? sourceOfWealth,
    String? stocksTradingExperience,
    String? stocksTradingFrequency,
    int? totalScore,
    String? tradingExperienceFinancialInstruments,
    String? tradingFrequencyFinancialInstruments,
    int? tradingScore,
  }) =>
      GetFinancialAssessment(
        accountTurnover: accountTurnover ?? this.accountTurnover,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdExperience: cfdExperience ?? this.cfdExperience,
        cfdFrequency: cfdFrequency ?? this.cfdFrequency,
        cfdScore: cfdScore ?? this.cfdScore,
        cfdTradingDefinition: cfdTradingDefinition ?? this.cfdTradingDefinition,
        cfdTradingExperience: cfdTradingExperience ?? this.cfdTradingExperience,
        cfdTradingFrequency: cfdTradingFrequency ?? this.cfdTradingFrequency,
        commoditiesTradingExperience:
            commoditiesTradingExperience ?? this.commoditiesTradingExperience,
        commoditiesTradingFrequency:
            commoditiesTradingFrequency ?? this.commoditiesTradingFrequency,
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
        indicesTradingExperience:
            indicesTradingExperience ?? this.indicesTradingExperience,
        indicesTradingFrequency:
            indicesTradingFrequency ?? this.indicesTradingFrequency,
        leverageImpactTrading:
            leverageImpactTrading ?? this.leverageImpactTrading,
        leverageTradingHighRiskStopLoss: leverageTradingHighRiskStopLoss ??
            this.leverageTradingHighRiskStopLoss,
        netIncome: netIncome ?? this.netIncome,
        occupation: occupation ?? this.occupation,
        otherDerivativesTradingExperience: otherDerivativesTradingExperience ??
            this.otherDerivativesTradingExperience,
        otherDerivativesTradingFrequency: otherDerivativesTradingFrequency ??
            this.otherDerivativesTradingFrequency,
        otherInstrumentsTradingExperience: otherInstrumentsTradingExperience ??
            this.otherInstrumentsTradingExperience,
        otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency ??
            this.otherInstrumentsTradingFrequency,
        requiredInitialMargin:
            requiredInitialMargin ?? this.requiredInitialMargin,
        riskTolerance: riskTolerance ?? this.riskTolerance,
        sourceOfExperience: sourceOfExperience ?? this.sourceOfExperience,
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
        stocksTradingExperience:
            stocksTradingExperience ?? this.stocksTradingExperience,
        stocksTradingFrequency:
            stocksTradingFrequency ?? this.stocksTradingFrequency,
        totalScore: totalScore ?? this.totalScore,
        tradingExperienceFinancialInstruments:
            tradingExperienceFinancialInstruments ??
                this.tradingExperienceFinancialInstruments,
        tradingFrequencyFinancialInstruments:
            tradingFrequencyFinancialInstruments ??
                this.tradingFrequencyFinancialInstruments,
        tradingScore: tradingScore ?? this.tradingScore,
      );
}
