/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/set_financial_assessment_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// SetFinancialAssessmentResponse class
class SetFinancialAssessmentResponse extends Response {
  /// Initialize SetFinancialAssessmentResponse
  const SetFinancialAssessmentResponse({
    this.setFinancialAssessment,
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
  factory SetFinancialAssessmentResponse.fromJson(Map<String, dynamic> json) =>
      SetFinancialAssessmentResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        setFinancialAssessment:
            json['set_financial_assessment'] as Map<String, dynamic>,
      );

  /// The financial assessment score assigned to the submitted financial assessment
  final Map<String, dynamic> setFinancialAssessment;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'set_financial_assessment': setFinancialAssessment,
      };

  /// Creates a copy of instance with given parameters
  @override
  SetFinancialAssessmentResponse copyWith({
    Map<String, dynamic> setFinancialAssessment,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      SetFinancialAssessmentResponse(
        setFinancialAssessment:
            setFinancialAssessment ?? this.setFinancialAssessment,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
