// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticks_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicksRequest _$TicksRequestFromJson(Map<String, dynamic> json) {
  return TicksRequest()
    ..ticks = json['ticks'] as String
    ..subscribe = json['subscribe'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TicksRequestToJson(TicksRequest instance) =>
    <String, dynamic>{
      'ticks': instance.ticks,
      'subscribe': instance.subscribe,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
