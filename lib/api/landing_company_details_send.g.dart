// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_company_details_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandingCompanyDetailsRequest _$LandingCompanyDetailsRequestFromJson(
    Map<String, dynamic> json) {
  return LandingCompanyDetailsRequest()
    ..landingCompanyDetails = json['landing_company_details'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$LandingCompanyDetailsRequestToJson(
        LandingCompanyDetailsRequest instance) =>
    <String, dynamic>{
      'landing_company_details': instance.landingCompanyDetails,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
