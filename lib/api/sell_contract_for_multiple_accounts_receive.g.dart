// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_contract_for_multiple_accounts_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellContractForMultipleAccountsResponse
    _$SellContractForMultipleAccountsResponseFromJson(
        Map<String, dynamic> json) {
  return SellContractForMultipleAccountsResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    sellContractForMultipleAccounts:
        json['sell_contract_for_multiple_accounts'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellContractForMultipleAccountsResponseToJson(
        SellContractForMultipleAccountsResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'sell_contract_for_multiple_accounts':
          instance.sellContractForMultipleAccounts,
    };
