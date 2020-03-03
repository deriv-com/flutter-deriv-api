// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_new_account_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5NewAccountResponse _$Mt5NewAccountResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5NewAccountResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    mt5NewAccount: json['mt5_new_account'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$Mt5NewAccountResponseToJson(
        Mt5NewAccountResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'mt5_new_account': instance.mt5NewAccount,
    };
