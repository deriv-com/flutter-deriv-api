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
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$LandingCompanyDetailsResponseToJson(
        LandingCompanyDetailsResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'landing_company_details': instance.landingCompanyDetails,
    };
