// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_contract_for_multiple_accounts_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellContractForMultipleAccountsResponse
    _$SellContractForMultipleAccountsResponseFromJson(
        Map<String, dynamic> json) {
  return SellContractForMultipleAccountsResponse(
    sellContractForMultipleAccounts:
        json['sell_contract_for_multiple_accounts'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellContractForMultipleAccountsResponseToJson(
        SellContractForMultipleAccountsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'sell_contract_for_multiple_accounts':
          instance.sellContractForMultipleAccounts,
    };
