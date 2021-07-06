/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Get financial assessment send class.
class GetFinancialAssessmentSend extends Request {
  /// Initialize GetFinancialAssessmentSend.
  const GetFinancialAssessmentSend({
    this.getFinancialAssessment = true,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'get_financial_assessment',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory GetFinancialAssessmentSend.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessmentSend(
        getFinancialAssessment: json['get_financial_assessment'] == null
            ? null
            : json['get_financial_assessment'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? getFinancialAssessment;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_financial_assessment': getFinancialAssessment == null
            ? null
            : getFinancialAssessment!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetFinancialAssessmentSend copyWith({
    bool? getFinancialAssessment,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      GetFinancialAssessmentSend(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
