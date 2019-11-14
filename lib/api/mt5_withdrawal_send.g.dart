// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_withdrawal_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5WithdrawalRequest _$Mt5WithdrawalRequestFromJson(Map<String, dynamic> json) {
  return Mt5WithdrawalRequest()
    ..mt5Withdrawal = json['mt5_withdrawal'] as int
    ..amount = json['amount'] as num
    ..fromMt5 = json['from_mt5'] as String
    ..toBinary = json['to_binary'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5WithdrawalRequestToJson(
        Mt5WithdrawalRequest instance) =>
    <String, dynamic>{
      'mt5_withdrawal': instance.mt5Withdrawal,
      'amount': instance.amount,
      'from_mt5': instance.fromMt5,
      'to_binary': instance.toBinary,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
