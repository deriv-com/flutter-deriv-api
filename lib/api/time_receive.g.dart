// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeResponse _$TimeResponseFromJson(Map<String, dynamic> json) {
  return TimeResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int
    ..time = json['time'] as int;
}

Map<String, dynamic> _$TimeResponseToJson(TimeResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'time': instance.time,
    };
