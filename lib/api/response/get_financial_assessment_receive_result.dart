import '../../basic_api/generated/get_financial_assessment_receive.dart';
import '../../basic_api/generated/get_financial_assessment_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Get financial assessment response model class.
abstract class GetFinancialAssessmentResponseModel {
  /// Initializes.
  GetFinancialAssessmentResponseModel({
    this.getFinancialAssessment,
  });

  /// Client's financial assessment details
  final GetFinancialAssessment? getFinancialAssessment;
}

/// Get financial assessment response class.
class GetFinancialAssessmentResponse
    extends GetFinancialAssessmentResponseModel {
  /// Initializes
  GetFinancialAssessmentResponse({
    GetFinancialAssessment? getFinancialAssessment,
  }) : super(
          getFinancialAssessment: getFinancialAssessment,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessmentResponse.fromJson(
    dynamic getFinancialAssessmentJson,
  ) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment: getFinancialAssessmentJson == null
            ? null
            : GetFinancialAssessment.fromJson(getFinancialAssessmentJson),
      );

  /// Converts an instance to JSON
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
    GetFinancialAssessmentSend request,
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
}
/// Get financial assessment model class.
abstract class GetFinancialAssessmentModel {
  /// Initializes.
  GetFinancialAssessmentModel({
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

/// Get financial assessment class.
class GetFinancialAssessment extends GetFinancialAssessmentModel {
  /// Initializes
  GetFinancialAssessment({
    String? accountTurnover,
    String? binaryOptionsTradingExperience,
    String? binaryOptionsTradingFrequency,
    int? cfdScore,
    String? cfdTradingExperience,
    String? cfdTradingFrequency,
    String? educationLevel,
    String? employmentIndustry,
    String? employmentStatus,
    String? estimatedWorth,
    int? financialInformationScore,
    String? forexTradingExperience,
    String? forexTradingFrequency,
    String? incomeSource,
    String? netIncome,
    String? occupation,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    String? sourceOfWealth,
    int? totalScore,
    int? tradingScore,
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

  /// Creates an instance from JSON
  factory GetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessment(
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

  /// Converts an instance to JSON
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
    resultMap['education_level'] = educationLevel;
    resultMap['employment_industry'] = employmentIndustry;
    resultMap['employment_status'] = employmentStatus;
    resultMap['estimated_worth'] = estimatedWorth;
    resultMap['financial_information_score'] = financialInformationScore;
    resultMap['forex_trading_experience'] = forexTradingExperience;
    resultMap['forex_trading_frequency'] = forexTradingFrequency;
    resultMap['income_source'] = incomeSource;
    resultMap['net_income'] = netIncome;
    resultMap['occupation'] = occupation;
    resultMap['other_instruments_trading_experience'] =
        otherInstrumentsTradingExperience;
    resultMap['other_instruments_trading_frequency'] =
        otherInstrumentsTradingFrequency;
    resultMap['source_of_wealth'] = sourceOfWealth;
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
    String? educationLevel,
    String? employmentIndustry,
    String? employmentStatus,
    String? estimatedWorth,
    int? financialInformationScore,
    String? forexTradingExperience,
    String? forexTradingFrequency,
    String? incomeSource,
    String? netIncome,
    String? occupation,
    String? otherInstrumentsTradingExperience,
    String? otherInstrumentsTradingFrequency,
    String? sourceOfWealth,
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
}
