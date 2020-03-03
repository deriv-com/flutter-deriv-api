// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ping_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PingResponse _$PingResponseFromJson(Map<String, dynamic> json) {
  return PingResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    ping: json['ping'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$PingResponseToJson(PingResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'ping': instance.ping,
      'req_id': instance.reqId,
    };
