// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_history_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksHistoryResponse _$TicksHistoryResponseFromJson(Map<String, dynamic> json) {
  return TicksHistoryResponse()
    ..candles = (json['candles'] as List).map((e) => e as String).toList()
    ..history = json['history'] as Map<String, dynamic>
    ..pipSize = json['pip_size'] as num
    ..subscription = json['subscription'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TicksHistoryResponseToJson(
        TicksHistoryResponse instance) =>
    <String, dynamic>{
      'candles': instance.candles,
      'history': instance.history,
      'pip_size': instance.pipSize,
      'subscription': instance.subscription,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
