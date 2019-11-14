// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_contract_for_multiple_accounts_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellContractForMultipleAccountsRequest
    _$SellContractForMultipleAccountsRequestFromJson(
        Map<String, dynamic> json) {
  return SellContractForMultipleAccountsRequest()
    ..sellContractForMultipleAccounts =
        json['sell_contract_for_multiple_accounts'] as int
    ..price = json['price'] as num
    ..shortcode = json['shortcode'] as String
    ..tokens = (json['tokens'] as List).map((e) => e as String).toList()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$SellContractForMultipleAccountsRequestToJson(
        SellContractForMultipleAccountsRequest instance) =>
    <String, dynamic>{
      'sell_contract_for_multiple_accounts':
          instance.sellContractForMultipleAccounts,
      'price': instance.price,
      'shortcode': instance.shortcode,
      'tokens': instance.tokens,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
