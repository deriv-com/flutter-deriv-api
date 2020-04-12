// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_company_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingCompanyResponse _$LandingCompanyResponseFromJson(
    Map<String, dynamic> json) {
  return LandingCompanyResponse(
    landingCompany: json['landing_company'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$LandingCompanyResponseToJson(
        LandingCompanyResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'landing_company': instance.landingCompany,
    };
