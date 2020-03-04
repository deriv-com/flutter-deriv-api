// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_financial_assessment_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFinancialAssessmentRequest _$GetFinancialAssessmentRequestFromJson(
    Map<String, dynamic> json) {
  return GetFinancialAssessmentRequest(
    getFinancialAssessment: json['get_financial_assessment'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetFinancialAssessmentRequestToJson(
        GetFinancialAssessmentRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'get_financial_assessment': instance.getFinancialAssessment,
    };
