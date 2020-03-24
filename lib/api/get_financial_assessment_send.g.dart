// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_financial_assessment_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFinancialAssessmentRequest _$GetFinancialAssessmentRequestFromJson(
    Map<String, dynamic> json) {
  return GetFinancialAssessmentRequest(
    getFinancialAssessment: json['get_financial_assessment'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$GetFinancialAssessmentRequestToJson(
        GetFinancialAssessmentRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'get_financial_assessment': instance.getFinancialAssessment,
    };
