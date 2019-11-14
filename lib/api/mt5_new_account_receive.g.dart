// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_new_account_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5NewAccountResponse _$Mt5NewAccountResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5NewAccountResponse()
    ..mt5NewAccount = json['mt5_new_account'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5NewAccountResponseToJson(
        Mt5NewAccountResponse instance) =>
    <String, dynamic>{
      'mt5_new_account': instance.mt5NewAccount,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
