// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_company_details_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingCompanyDetailsResponse _$LandingCompanyDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return LandingCompanyDetailsResponse(
    landingCompanyDetails:
        json['landing_company_details'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$LandingCompanyDetailsResponseToJson(
        LandingCompanyDetailsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'landing_company_details': instance.landingCompanyDetails,
    };
