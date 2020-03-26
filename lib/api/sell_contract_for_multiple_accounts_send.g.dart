// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_contract_for_multiple_accounts_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellContractForMultipleAccountsRequest
    _$SellContractForMultipleAccountsRequestFromJson(
        Map<String, dynamic> json) {
  return SellContractForMultipleAccountsRequest(
    price: json['price'] as num,
    sellContractForMultipleAccounts:
        json['sell_contract_for_multiple_accounts'] as int,
    shortcode: json['shortcode'] as String,
    tokens: (json['tokens'] as List)?.map((e) => e as String)?.toList(),
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellContractForMultipleAccountsRequestToJson(
        SellContractForMultipleAccountsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'price': instance.price,
      'sell_contract_for_multiple_accounts':
          instance.sellContractForMultipleAccounts,
      'shortcode': instance.shortcode,
      'tokens': instance.tokens,
    };
