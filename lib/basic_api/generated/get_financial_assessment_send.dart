/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_send.json
// ignore_for_file: avoid_as

import '../request.dart';

/// Get financial assessment request class
class GetFinancialAssessmentRequest extends Request {
  /// Initialize GetFinancialAssessmentRequest
  const GetFinancialAssessmentRequest({
    this.getFinancialAssessment = true,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'get_financial_assessment',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessmentRequest(
        getFinancialAssessment: json['get_financial_assessment'] == null
            ? null
            : json['get_financial_assessment'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Must be `true`
  final bool getFinancialAssessment;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_financial_assessment': getFinancialAssessment == null
            ? null
            : getFinancialAssessment ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetFinancialAssessmentRequest copyWith({
    bool getFinancialAssessment,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      GetFinancialAssessmentRequest(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
