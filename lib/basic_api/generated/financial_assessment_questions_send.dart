/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/financial_assessment_questions_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Financial assessment questions request class.
class FinancialAssessmentQuestionsRequest extends Request {
  /// Initialize FinancialAssessmentQuestionsRequest.
  const FinancialAssessmentQuestionsRequest({
    this.financialAssessmentQuestions = true,
    this.landingCompanyShort,
    this.loginid,
    this.version,
    super.msgType = 'financial_assessment_questions',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory FinancialAssessmentQuestionsRequest.fromJson(
          Map<String, dynamic> json) =>
      FinancialAssessmentQuestionsRequest(
        financialAssessmentQuestions:
            json['financial_assessment_questions'] == null
                ? null
                : json['financial_assessment_questions'] == 1,
        landingCompanyShort: json['landing_company_short'] as String?,
        loginid: json['loginid'] as String?,
        version: json['version'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? financialAssessmentQuestions;

  /// [Optional] The landing company the account.
  final String? landingCompanyShort;

  /// [Optional] The login id of the user. Mandatory when multiple tokens were provided during authorize.
  final String? loginid;

  /// [Optional] The version of the financial assessment questionnaire.
  final String? version;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'financial_assessment_questions': financialAssessmentQuestions == null
            ? null
            : financialAssessmentQuestions!
                ? 1
                : 0,
        'landing_company_short': landingCompanyShort,
        'loginid': loginid,
        'version': version,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  FinancialAssessmentQuestionsRequest copyWith({
    bool? financialAssessmentQuestions,
    String? landingCompanyShort,
    String? loginid,
    String? version,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      FinancialAssessmentQuestionsRequest(
        financialAssessmentQuestions:
            financialAssessmentQuestions ?? this.financialAssessmentQuestions,
        landingCompanyShort: landingCompanyShort ?? this.landingCompanyShort,
        loginid: loginid ?? this.loginid,
        version: version ?? this.version,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
