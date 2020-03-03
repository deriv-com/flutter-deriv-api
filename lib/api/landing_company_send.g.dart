// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_company_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingCompanyRequest _$LandingCompanyRequestFromJson(
    Map<String, dynamic> json) {
  return LandingCompanyRequest(
    landingCompany: json['landing_company'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$LandingCompanyRequestToJson(
        LandingCompanyRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'landing_company': instance.landingCompany,
    };
