// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_company_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingCompanyResponse _$LandingCompanyResponseFromJson(
    Map<String, dynamic> json) {
  return LandingCompanyResponse(
    landingCompany: json['landing_company'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$LandingCompanyResponseToJson(
        LandingCompanyResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'landing_company': instance.landingCompany,
    };
