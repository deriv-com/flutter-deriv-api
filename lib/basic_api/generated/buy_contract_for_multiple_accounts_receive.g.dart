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
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$BuyContractForMultipleAccountsResponseToJson(
        BuyContractForMultipleAccountsResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'buy_contract_for_multiple_accounts':
          instance.buyContractForMultipleAccounts,
    };
