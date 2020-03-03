// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_stop_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStopRequest _$CopyStopRequestFromJson(Map<String, dynamic> json) {
  return CopyStopRequest(
    copyStop: json['copy_stop'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CopyStopRequestToJson(CopyStopRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'copy_stop': instance.copyStop,
    };
