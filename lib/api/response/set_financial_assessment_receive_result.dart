import '../../basic_api/generated/set_financial_assessment_receive.dart';
import '../../basic_api/generated/set_financial_assessment_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Set financial assessment response model class.
abstract class SetFinancialAssessmentResponseModel {
  /// Initializes Set financial assessment response model class .
  SetFinancialAssessmentResponseModel({
    this.setFinancialAssessment,
  });

  /// The financial assessment score assigned to the submitted financial assessment
  final SetFinancialAssessment? setFinancialAssessment;
}

/// Set financial assessment response class.
class SetFinancialAssessmentResponse
    extends SetFinancialAssessmentResponseModel {
  /// Initializes Set financial assessment response class.
  SetFinancialAssessmentResponse({
    SetFinancialAssessment? setFinancialAssessment,
  }) : super(
          setFinancialAssessment: setFinancialAssessment,
        );

  /// Creates an instance from JSON.
  factory SetFinancialAssessmentResponse.fromJson(
    dynamic setFinancialAssessmentJson,
  ) =>
      SetFinancialAssessmentResponse(
        setFinancialAssessment: setFinancialAssessmentJson == null
            ? null
            : SetFinancialAssessment.fromJson(setFinancialAssessmentJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (setFinancialAssessment != null) {
      resultMap['set_financial_assessment'] = setFinancialAssessment!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Sets the financial assessment details based on the client's answers to
  /// analyze whether they possess the experience and knowledge to
  /// understand the risks involved with binary options trading.
  ///
  /// For parameters information refer to [SetFinancialAssessmentRequest].
  /// Throws a [FinancialAssessmentException] if API response contains an error
  static Future<SetFinancialAssessmentResponse> setAssessment(
    SetFinancialAssessmentRequest request,
  ) async {
    final SetFinancialAssessmentReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          FinancialAssessmentException(baseExceptionModel: baseExceptionModel),
    );

    return SetFinancialAssessmentResponse.fromJson(
        response.setFinancialAssessment);
  }

  /// Creates a copy of instance with given parameters.
  SetFinancialAssessmentResponse copyWith({
    SetFinancialAssessment? setFinancialAssessment,
  }) =>
      SetFinancialAssessmentResponse(
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
      );
}
/// Set financial assessment model class.
abstract class SetFinancialAssessmentModel {
  /// Initializes Set financial assessment model class .
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

/// Set financial assessment class.
class SetFinancialAssessment extends SetFinancialAssessmentModel {
  /// Initializes Set financial assessment class.
  SetFinancialAssessment({
    int? cfdScore,
    int? financialInformationScore,
    int? totalScore,
    int? tradingScore,
  }) : super(
          cfdScore: cfdScore,
          financialInformationScore: financialInformationScore,
          totalScore: totalScore,
          tradingScore: tradingScore,
        );

  /// Creates an instance from JSON.
  factory SetFinancialAssessment.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessment(
        cfdScore: json['cfd_score'],
        financialInformationScore: json['financial_information_score'],
        totalScore: json['total_score'],
        tradingScore: json['trading_score'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['cfd_score'] = cfdScore;
    resultMap['financial_information_score'] = financialInformationScore;
    resultMap['total_score'] = totalScore;
    resultMap['trading_score'] = tradingScore;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  SetFinancialAssessment copyWith({
    int? cfdScore,
    int? financialInformationScore,
    int? totalScore,
    int? tradingScore,
  }) =>
      SetFinancialAssessment(
        cfdScore: cfdScore ?? this.cfdScore,
        financialInformationScore:
            financialInformationScore ?? this.financialInformationScore,
        totalScore: totalScore ?? this.totalScore,
        tradingScore: tradingScore ?? this.tradingScore,
      );
}
