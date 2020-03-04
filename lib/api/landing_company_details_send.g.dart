// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_company_details_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingCompanyDetailsRequest _$LandingCompanyDetailsRequestFromJson(
    Map<String, dynamic> json) {
  return LandingCompanyDetailsRequest(
    landingCompanyDetails: json['landing_company_details'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$LandingCompanyDetailsRequestToJson(
        LandingCompanyDetailsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'landing_company_details': instance.landingCompanyDetails,
    };
