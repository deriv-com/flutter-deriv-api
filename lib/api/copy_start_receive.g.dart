// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_start_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStartResponse _$CopyStartResponseFromJson(Map<String, dynamic> json) {
  return CopyStartResponse(
    copyStart: json['copy_start'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CopyStartResponseToJson(CopyStartResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'copy_start': instance.copyStart,
    };
