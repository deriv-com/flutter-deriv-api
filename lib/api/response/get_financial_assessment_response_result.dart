// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/get_financial_assessment_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// Get financial assessment response model class.
abstract class GetFinancialAssessmentResponseModel extends Equatable {
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
    GetFinancialAssessment? getFinancialAssessment,
  }) : super(
          getFinancialAssessment: getFinancialAssessment,
        );

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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the financial assessment details.
  ///
  /// The 'financial assessment' is a questionnaire that clients of certain Landing Companies need to complete,
  /// due to regulatory and KYC (know your client) requirements.
  /// Throws a [FinancialAssessmentException] if API response contains an error
  static Future<GetFinancialAssessmentResponse> fetchAssessment(
    GetFinancialAssessmentRequest request,
  ) async {
    final GetFinancialAssessmentReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          FinancialAssessmentException(baseExceptionModel: baseExceptionModel),
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

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Get financial assessment model class.
abstract class GetFinancialAssessmentModel extends Equatable {
  /// Initializes Get financial assessment model class .
  const GetFinancialAssessmentModel({
    this.accountTurnover,
    this.binaryOptionsTradingExperience,
    this.binaryOptionsTradingFrequency,
    this.cfdScore,
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
    this.netIncome,
    this.occupation,
    this.otherDerivativesTradingExperience,
    this.otherDerivativesTradingFrequency,
    this.otherInstrumentsTradingExperience,
    this.otherInstrumentsTradingFrequency,
    this.sourceOfWealth,
    this.stocksTradingExperience,
    this.stocksTradingFrequency,
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

  /// Source of wealth
  final String? sourceOfWealth;

  /// Stocks trading experience
  final String? stocksTradingExperience;

  /// Stocks trading frequency
  final String? stocksTradingFrequency;

  /// Total Score
  final int? totalScore;

  /// Trading Experience Score
  final int? tradingScore;
}

/// Get financial assessment class.
class GetFinancialAssessment extends GetFinancialAssessmentModel {
  /// Initializes Get financial assessment class.
  const GetFinancialAssessment({
    String? accountTurnover,
    String? binaryOptionsTradingExperience,
    String? binaryOptionsTradingFrequency,
    int? cfdScore,
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
    String? netIncome,
    String? occupation,
    String? otherDerivativesTradingExperience,
    String? otherDerivativesTradingFrequency,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    String? sourceOfWealth,
    String? stocksTradingExperience,
    String? stocksTradingFrequency,
    int? totalScore,
    int? tradingScore,
  }) : super(
          accountTurnover: accountTurnover,
          binaryOptionsTradingExperience: binaryOptionsTradingExperience,
          binaryOptionsTradingFrequency: binaryOptionsTradingFrequency,
          cfdScore: cfdScore,
          cfdTradingExperience: cfdTradingExperience,
          cfdTradingFrequency: cfdTradingFrequency,
          commoditiesTradingExperience: commoditiesTradingExperience,
          commoditiesTradingFrequency: commoditiesTradingFrequency,
          educationLevel: educationLevel,
          employmentIndustry: employmentIndustry,
          employmentStatus: employmentStatus,
          estimatedWorth: estimatedWorth,
          financialInformationScore: financialInformationScore,
          forexTradingExperience: forexTradingExperience,
          forexTradingFrequency: forexTradingFrequency,
          incomeSource: incomeSource,
          indicesTradingExperience: indicesTradingExperience,
          indicesTradingFrequency: indicesTradingFrequency,
          netIncome: netIncome,
          occupation: occupation,
          otherDerivativesTradingExperience: otherDerivativesTradingExperience,
          otherDerivativesTradingFrequency: otherDerivativesTradingFrequency,
          otherInstrumentsTradingExperience: otherInstrumentsTradingExperience,
          otherInstrumentsTradingFrequency: otherInstrumentsTradingFrequency,
          sourceOfWealth: sourceOfWealth,
          stocksTradingExperience: stocksTradingExperience,
          stocksTradingFrequency: stocksTradingFrequency,
          totalScore: totalScore,
          tradingScore: tradingScore,
        );

  /// Creates an instance from JSON.
  factory GetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessment(
        accountTurnover: json['account_turnover'],
        binaryOptionsTradingExperience:
            json['binary_options_trading_experience'],
        binaryOptionsTradingFrequency: json['binary_options_trading_frequency'],
        cfdScore: json['cfd_score'],
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
        sourceOfWealth: json['source_of_wealth'],
        stocksTradingExperience: json['stocks_trading_experience'],
        stocksTradingFrequency: json['stocks_trading_frequency'],
        totalScore: json['total_score'],
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
    resultMap['cfd_score'] = cfdScore;
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
    resultMap['source_of_wealth'] = sourceOfWealth;
    resultMap['stocks_trading_experience'] = stocksTradingExperience;
    resultMap['stocks_trading_frequency'] = stocksTradingFrequency;
    resultMap['total_score'] = totalScore;
    resultMap['trading_score'] = tradingScore;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  GetFinancialAssessment copyWith({
    String? accountTurnover,
    String? binaryOptionsTradingExperience,
    String? binaryOptionsTradingFrequency,
    int? cfdScore,
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
    String? netIncome,
    String? occupation,
    String? otherDerivativesTradingExperience,
    String? otherDerivativesTradingFrequency,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    String? sourceOfWealth,
    String? stocksTradingExperience,
    String? stocksTradingFrequency,
    int? totalScore,
    int? tradingScore,
  }) =>
      GetFinancialAssessment(
        accountTurnover: accountTurnover ?? this.accountTurnover,
        binaryOptionsTradingExperience: binaryOptionsTradingExperience ??
            this.binaryOptionsTradingExperience,
        binaryOptionsTradingFrequency:
            binaryOptionsTradingFrequency ?? this.binaryOptionsTradingFrequency,
        cfdScore: cfdScore ?? this.cfdScore,
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
        sourceOfWealth: sourceOfWealth ?? this.sourceOfWealth,
        stocksTradingExperience:
            stocksTradingExperience ?? this.stocksTradingExperience,
        stocksTradingFrequency:
            stocksTradingFrequency ?? this.stocksTradingFrequency,
        totalScore: totalScore ?? this.totalScore,
        tradingScore: tradingScore ?? this.tradingScore,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
