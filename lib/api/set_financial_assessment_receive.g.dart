// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_financial_assessment_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetFinancialAssessmentResponse _$SetFinancialAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return SetFinancialAssessmentResponse(
    setFinancialAssessment:
        json['set_financial_assessment'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetFinancialAssessmentResponseToJson(
        SetFinancialAssessmentResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'set_financial_assessment': instance.setFinancialAssessment,
    };
