/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_send.json

import '../request.dart';

/// GetFinancialAssessmentRequest class
class GetFinancialAssessmentRequest extends Request {
  /// Initialize GetFinancialAssessmentRequest
  const GetFinancialAssessmentRequest({
    this.getFinancialAssessment = 1,
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
        // ignore: avoid_as
        getFinancialAssessment: json['get_financial_assessment'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Must be `1`
  final int getFinancialAssessment;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_financial_assessment': getFinancialAssessment,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetFinancialAssessmentRequest copyWith({
    int getFinancialAssessment,
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
