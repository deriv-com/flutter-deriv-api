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
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$LandingCompanyResponseToJson(
        LandingCompanyResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'landing_company': instance.landingCompany,
    };
