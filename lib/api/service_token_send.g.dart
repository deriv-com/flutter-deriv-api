// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_token_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTokenRequest _$ServiceTokenRequestFromJson(Map<String, dynamic> json) {
  return ServiceTokenRequest(
    referrer: json['referrer'] as String,
    service: json['service'] as String,
    serviceToken: json['service_token'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ServiceTokenRequestToJson(
        ServiceTokenRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'referrer': instance.referrer,
      'service': instance.service,
      'service_token': instance.serviceToken,
    };
