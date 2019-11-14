// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountVirtualResponse _$NewAccountVirtualResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountVirtualResponse()
    ..newAccountVirtual = json['new_account_virtual'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$NewAccountVirtualResponseToJson(
        NewAccountVirtualResponse instance) =>
    <String, dynamic>{
      'new_account_virtual': instance.newAccountVirtual,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
