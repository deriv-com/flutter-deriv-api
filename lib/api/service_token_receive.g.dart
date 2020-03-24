// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_token_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceTokenResponse _$ServiceTokenResponseFromJson(Map<String, dynamic> json) {
  return ServiceTokenResponse(
    serviceToken: json['service_token'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ServiceTokenResponseToJson(
        ServiceTokenResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'service_token': instance.serviceToken,
    };
