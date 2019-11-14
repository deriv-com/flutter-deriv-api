// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_withdrawal_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5WithdrawalResponse _$Mt5WithdrawalResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5WithdrawalResponse()
    ..mt5Withdrawal = json['mt5_withdrawal'] as int
    ..binaryTransactionId = json['binary_transaction_id'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5WithdrawalResponseToJson(
        Mt5WithdrawalResponse instance) =>
    <String, dynamic>{
      'mt5_withdrawal': instance.mt5Withdrawal,
      'binary_transaction_id': instance.binaryTransactionId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
