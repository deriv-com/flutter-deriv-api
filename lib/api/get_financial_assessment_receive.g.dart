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
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetFinancialAssessmentResponseToJson(
        GetFinancialAssessmentResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'get_financial_assessment': instance.getFinancialAssessment,
    };
