// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_deposit_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5DepositResponse _$Mt5DepositResponseFromJson(Map<String, dynamic> json) {
  return Mt5DepositResponse()
    ..binaryTransactionId = json['binary_transaction_id'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..mt5Deposit = json['mt5_deposit'] as int
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5DepositResponseToJson(Mt5DepositResponse instance) =>
    <String, dynamic>{
      'binary_transaction_id': instance.binaryTransactionId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'mt5_deposit': instance.mt5Deposit,
      'req_id': instance.reqId,
    };
