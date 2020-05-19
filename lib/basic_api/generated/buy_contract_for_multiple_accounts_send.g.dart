// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_contract_for_multiple_accounts_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyContractForMultipleAccountsRequest
    _$BuyContractForMultipleAccountsRequestFromJson(Map<String, dynamic> json) {
  return BuyContractForMultipleAccountsRequest(
    buyContractForMultipleAccounts:
        json['buy_contract_for_multiple_accounts'] as String,
    parameters: json['parameters'] as Map<String, dynamic>,
    price: json['price'] as num,
    tokens: (json['tokens'] as List)?.map((e) => e as String)?.toList(),
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$BuyContractForMultipleAccountsRequestToJson(
        BuyContractForMultipleAccountsRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'buy_contract_for_multiple_accounts':
          instance.buyContractForMultipleAccounts,
      'parameters': instance.parameters,
      'price': instance.price,
      'tokens': instance.tokens,
    };
