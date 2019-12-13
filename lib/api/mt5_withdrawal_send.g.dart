// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_withdrawal_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5WithdrawalRequest _$Mt5WithdrawalRequestFromJson(Map<String, dynamic> json) {
  return Mt5WithdrawalRequest(
    amount: json['amount'] as num,
    fromMt5: json['from_mt5'] as String,
    mt5Withdrawal: json['mt5_withdrawal'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    toBinary: json['to_binary'] as String,
  );
}

Map<String, dynamic> _$Mt5WithdrawalRequestToJson(
        Mt5WithdrawalRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'from_mt5': instance.fromMt5,
      'mt5_withdrawal': instance.mt5Withdrawal,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'to_binary': instance.toBinary,
    };
