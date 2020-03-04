// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksRequest _$TicksRequestFromJson(Map<String, dynamic> json) {
  return TicksRequest(
    subscribe: json['subscribe'] as int,
    ticks: json['ticks'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TicksRequestToJson(TicksRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'subscribe': instance.subscribe,
      'ticks': instance.ticks,
    };
