// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeResponse _$TimeResponseFromJson(Map<String, dynamic> json) {
  return TimeResponse(
    time: json['time'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TimeResponseToJson(TimeResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'time': instance.time,
    };
