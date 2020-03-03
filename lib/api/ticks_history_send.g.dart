// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_history_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksHistoryRequest _$TicksHistoryRequestFromJson(Map<String, dynamic> json) {
  return TicksHistoryRequest(
    adjustStartTime: json['adjust_start_time'] as int,
    count: json['count'] as int,
    end: json['end'] as String,
    granularity: json['granularity'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    start: json['start'] as int,
    style: json['style'] as String,
    subscribe: json['subscribe'] as int,
    ticksHistory: json['ticks_history'] as String,
  );
}

Map<String, dynamic> _$TicksHistoryRequestToJson(
        TicksHistoryRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'adjust_start_time': instance.adjustStartTime,
      'count': instance.count,
      'end': instance.end,
      'granularity': instance.granularity,
      'start': instance.start,
      'style': instance.style,
      'subscribe': instance.subscribe,
      'ticks_history': instance.ticksHistory,
    };
