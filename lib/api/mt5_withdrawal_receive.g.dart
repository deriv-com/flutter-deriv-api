// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_withdrawal_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5WithdrawalResponse _$Mt5WithdrawalResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5WithdrawalResponse(
    binaryTransactionId: json['binary_transaction_id'] as int,
    mt5Withdrawal: json['mt5_withdrawal'] as int,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5WithdrawalResponseToJson(
        Mt5WithdrawalResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'binary_transaction_id': instance.binaryTransactionId,
      'mt5_withdrawal': instance.mt5Withdrawal,
    };
