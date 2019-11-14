// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailRequest _$VerifyEmailRequestFromJson(Map<String, dynamic> json) {
  return VerifyEmailRequest()
    ..verifyEmail = json['verify_email'] as String
    ..type = json['type'] as String
    ..urlParameters = json['url_parameters'] as Map<String, dynamic>
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$VerifyEmailRequestToJson(VerifyEmailRequest instance) =>
    <String, dynamic>{
      'verify_email': instance.verifyEmail,
      'type': instance.type,
      'url_parameters': instance.urlParameters,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
