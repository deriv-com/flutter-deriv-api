// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksRequest _$TicksRequestFromJson(Map<String, dynamic> json) {
  return TicksRequest(
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
    ticks: json['ticks'] as String,
  );
}

Map<String, dynamic> _$TicksRequestToJson(TicksRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'subscribe': instance.subscribe,
      'ticks': instance.ticks,
    };
