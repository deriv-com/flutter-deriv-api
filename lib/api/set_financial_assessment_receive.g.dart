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
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetFinancialAssessmentResponseToJson(
        SetFinancialAssessmentResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'set_financial_assessment': instance.setFinancialAssessment,
    };
