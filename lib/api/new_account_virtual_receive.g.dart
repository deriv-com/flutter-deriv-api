// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountVirtualResponse _$NewAccountVirtualResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountVirtualResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    newAccountVirtual: json['new_account_virtual'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$NewAccountVirtualResponseToJson(
        NewAccountVirtualResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'new_account_virtual': instance.newAccountVirtual,
      'req_id': instance.reqId,
    };
