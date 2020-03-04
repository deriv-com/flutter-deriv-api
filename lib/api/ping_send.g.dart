// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingRequest _$PingRequestFromJson(Map<String, dynamic> json) {
  return PingRequest(
    ping: json['ping'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PingRequestToJson(PingRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'ping': instance.ping,
    };
