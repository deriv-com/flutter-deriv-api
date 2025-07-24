/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/financial_assessment_questions_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Financial assessment questions receive class.
class FinancialAssessmentQuestionsReceive extends Response {
  /// Initialize FinancialAssessmentQuestionsReceive.
  const FinancialAssessmentQuestionsReceive({
    this.financialAssessmentQuestions,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory FinancialAssessmentQuestionsReceive.fromJson(
          Map<String, dynamic> json) =>
      FinancialAssessmentQuestionsReceive(
        financialAssessmentQuestions:
            json['financial_assessment_questions'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The financial assessment questionnaire structure
  final Map<String, dynamic>? financialAssessmentQuestions;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'financial_assessment_questions': financialAssessmentQuestions,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  FinancialAssessmentQuestionsReceive copyWith({
    Map<String, dynamic>? financialAssessmentQuestions,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      FinancialAssessmentQuestionsReceive(
        financialAssessmentQuestions:
            financialAssessmentQuestions ?? this.financialAssessmentQuestions,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
