// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_financial_assessment_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFinancialAssessmentResponse _$GetFinancialAssessmentResponseFromJson(
    Map<String, dynamic> json) {
  return GetFinancialAssessmentResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    getFinancialAssessment:
        json['get_financial_assessment'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$GetFinancialAssessmentResponseToJson(
        GetFinancialAssessmentResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'get_financial_assessment': instance.getFinancialAssessment,
    };
