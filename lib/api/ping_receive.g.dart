// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingResponse _$PingResponseFromJson(Map<String, dynamic> json) {
  return PingResponse()
    ..ping = json['ping'] as String
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PingResponseToJson(PingResponse instance) =>
    <String, dynamic>{
      'ping': instance.ping,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
