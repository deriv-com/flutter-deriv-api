// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountVirtualResponse _$NewAccountVirtualResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountVirtualResponse(
    newAccountVirtual: json['new_account_virtual'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$NewAccountVirtualResponseToJson(
        NewAccountVirtualResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'new_account_virtual': instance.newAccountVirtual,
    };
