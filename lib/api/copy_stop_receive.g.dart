// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copy_stop_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopyStopResponse _$CopyStopResponseFromJson(Map<String, dynamic> json) {
  return CopyStopResponse()
    ..copyStop = json['copy_stop'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$CopyStopResponseToJson(CopyStopResponse instance) =>
    <String, dynamic>{
      'copy_stop': instance.copyStop,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
