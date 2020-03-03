// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) {
  return BalanceResponse(
    balance: json['balance'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BalanceResponseToJson(BalanceResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'balance': instance.balance,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
    };
