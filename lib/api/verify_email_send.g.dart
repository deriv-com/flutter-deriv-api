// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailRequest _$VerifyEmailRequestFromJson(Map<String, dynamic> json) {
  return VerifyEmailRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int
    ..type = json['type'] as String
    ..urlParameters = json['url_parameters'] as Map<String, dynamic>
    ..verifyEmail = json['verify_email'] as String;
}

Map<String, dynamic> _$VerifyEmailRequestToJson(VerifyEmailRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'type': instance.type,
      'url_parameters': instance.urlParameters,
      'verify_email': instance.verifyEmail,
    };
