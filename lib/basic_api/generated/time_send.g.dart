// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeRequest _$TimeRequestFromJson(Map<String, dynamic> json) {
  return TimeRequest(
    time: json['time'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$TimeRequestToJson(TimeRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'time': instance.time,
    };
