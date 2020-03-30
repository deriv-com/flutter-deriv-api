// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_deposit_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5DepositResponse _$Mt5DepositResponseFromJson(Map<String, dynamic> json) {
  return Mt5DepositResponse(
    binaryTransactionId: json['binary_transaction_id'] as int,
    mt5Deposit: json['mt5_deposit'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$Mt5DepositResponseToJson(Mt5DepositResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'binary_transaction_id': instance.binaryTransactionId,
      'mt5_deposit': instance.mt5Deposit,
    };
