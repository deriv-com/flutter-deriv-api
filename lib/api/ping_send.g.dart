// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingRequest _$PingRequestFromJson(Map<String, dynamic> json) {
  return PingRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..ping = json['ping'] as int
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PingRequestToJson(PingRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'ping': instance.ping,
      'req_id': instance.reqId,
    };
