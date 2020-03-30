// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountVirtualResponse _$NewAccountVirtualResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountVirtualResponse(
    newAccountVirtual: json['new_account_virtual'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$NewAccountVirtualResponseToJson(
        NewAccountVirtualResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'new_account_virtual': instance.newAccountVirtual,
    };
