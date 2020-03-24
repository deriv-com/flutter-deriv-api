// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_start_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStartResponse _$CopyStartResponseFromJson(Map<String, dynamic> json) {
  return CopyStartResponse(
    copyStart: json['copy_start'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CopyStartResponseToJson(CopyStartResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'copy_start': instance.copyStart,
    };
