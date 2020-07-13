/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/get_financial_assessment_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Get financial assessment response class
class GetFinancialAssessmentResponse extends Response {
  /// Initialize GetFinancialAssessmentResponse
  const GetFinancialAssessmentResponse({
    this.getFinancialAssessment,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory GetFinancialAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment:
            json['get_financial_assessment'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Client's financial assessment details
  final Map<String, dynamic> getFinancialAssessment;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'get_financial_assessment': getFinancialAssessment,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  GetFinancialAssessmentResponse copyWith({
    Map<String, dynamic> getFinancialAssessment,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      GetFinancialAssessmentResponse(
        getFinancialAssessment:
            getFinancialAssessment ?? this.getFinancialAssessment,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
