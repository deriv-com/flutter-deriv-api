// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelResponse _$CancelResponseFromJson(Map<String, dynamic> json) {
  return CancelResponse(
    cancel: json['cancel'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CancelResponseToJson(CancelResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'cancel': instance.cancel,
    };
