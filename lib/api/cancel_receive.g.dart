// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelResponse _$CancelResponseFromJson(Map<String, dynamic> json) {
  return CancelResponse(
    cancel: json['cancel'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CancelResponseToJson(CancelResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'cancel': instance.cancel,
    };
