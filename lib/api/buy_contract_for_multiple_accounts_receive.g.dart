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
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$BuyContractForMultipleAccountsResponseToJson(
        BuyContractForMultipleAccountsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'buy_contract_for_multiple_accounts':
          instance.buyContractForMultipleAccounts,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
