// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_financial_assessment_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFinancialAssessmentResponse _$GetFinancialAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetFinancialAssessmentResponse(
    getFinancialAssessment:
        json['get_financial_assessment'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$GetFinancialAssessmentResponseToJson(
        GetFinancialAssessmentResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'get_financial_assessment': instance.getFinancialAssessment,
    };
