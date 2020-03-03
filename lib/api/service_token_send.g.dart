// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_token_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTokenRequest _$ServiceTokenRequestFromJson(Map<String, dynamic> json) {
  return ServiceTokenRequest(
    passthrough: json['passthrough'] as Map<String, dynamic>,
    referrer: json['referrer'] as String,
    reqId: json['req_id'] as int,
    service: json['service'] as String,
    serviceToken: json['service_token'] as int,
  );
}

Map<String, dynamic> _$ServiceTokenRequestToJson(
        ServiceTokenRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'referrer': instance.referrer,
      'service': instance.service,
      'service_token': instance.serviceToken,
    };
