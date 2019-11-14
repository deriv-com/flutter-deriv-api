// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingRequest _$PingRequestFromJson(Map<String, dynamic> json) {
  return PingRequest()
    ..ping = json['ping'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PingRequestToJson(PingRequest instance) =>
    <String, dynamic>{
      'ping': instance.ping,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
