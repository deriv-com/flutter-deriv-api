// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceRequest _$BalanceRequestFromJson(Map<String, dynamic> json) {
  return BalanceRequest(
    account: json['account'] as String,
    balance: json['balance'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
  );
}

Map<String, dynamic> _$BalanceRequestToJson(BalanceRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'account': instance.account,
      'balance': instance.balance,
      'subscribe': instance.subscribe,
    };
