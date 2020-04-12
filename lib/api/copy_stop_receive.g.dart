// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_stop_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStopResponse _$CopyStopResponseFromJson(Map<String, dynamic> json) {
  return CopyStopResponse(
    copyStop: json['copy_stop'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CopyStopResponseToJson(CopyStopResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'copy_stop': instance.copyStop,
    };
