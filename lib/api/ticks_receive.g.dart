// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksResponse _$TicksResponseFromJson(Map<String, dynamic> json) {
  return TicksResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
    tick: json['tick'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TicksResponseToJson(TicksResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
      'tick': instance.tick,
    };
