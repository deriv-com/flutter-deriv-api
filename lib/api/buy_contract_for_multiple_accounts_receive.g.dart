// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_contract_for_multiple_accounts_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyContractForMultipleAccountsResponse
    _$BuyContractForMultipleAccountsResponseFromJson(
        Map<String, dynamic> json) {
  return BuyContractForMultipleAccountsResponse(
    buyContractForMultipleAccounts:
        json['buy_contract_for_multiple_accounts'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$BuyContractForMultipleAccountsResponseToJson(
        BuyContractForMultipleAccountsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'buy_contract_for_multiple_accounts':
          instance.buyContractForMultipleAccounts,
    };
