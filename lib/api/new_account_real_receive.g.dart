// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_real_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountRealResponse _$NewAccountRealResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountRealResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..newAccountReal = json['new_account_real'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$NewAccountRealResponseToJson(
        NewAccountRealResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'new_account_real': instance.newAccountReal,
      'req_id': instance.reqId,
    };
