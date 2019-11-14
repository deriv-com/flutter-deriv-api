// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_deposit_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5DepositRequest _$Mt5DepositRequestFromJson(Map<String, dynamic> json) {
  return Mt5DepositRequest()
    ..mt5Deposit = json['mt5_deposit'] as int
    ..amount = json['amount'] as num
    ..fromBinary = json['from_binary'] as String
    ..toMt5 = json['to_mt5'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5DepositRequestToJson(Mt5DepositRequest instance) =>
    <String, dynamic>{
      'mt5_deposit': instance.mt5Deposit,
      'amount': instance.amount,
      'from_binary': instance.fromBinary,
      'to_mt5': instance.toMt5,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
