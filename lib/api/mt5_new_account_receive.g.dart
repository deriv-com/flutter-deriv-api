// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_new_account_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5NewAccountResponse _$Mt5NewAccountResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5NewAccountResponse(
    mt5NewAccount: json['mt5_new_account'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5NewAccountResponseToJson(
        Mt5NewAccountResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'mt5_new_account': instance.mt5NewAccount,
    };
