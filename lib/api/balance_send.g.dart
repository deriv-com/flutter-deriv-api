// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceRequest _$BalanceRequestFromJson(Map<String, dynamic> json) {
  return BalanceRequest()
    ..balance = json['balance'] as int
    ..account = json['account'] as String
    ..subscribe = json['subscribe'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$BalanceRequestToJson(BalanceRequest instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'account': instance.account,
      'subscribe': instance.subscribe,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
