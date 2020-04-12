// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRequest _$TimeRequestFromJson(Map<String, dynamic> json) {
  return TimeRequest(
    time: json['time'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TimeRequestToJson(TimeRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'time': instance.time,
    };
