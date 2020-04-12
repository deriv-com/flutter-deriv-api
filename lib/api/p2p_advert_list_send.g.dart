// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertListRequest _$P2pAdvertListRequestFromJson(Map<String, dynamic> json) {
  return P2pAdvertListRequest(
    advertiserId: json['advertiser_id'] as String,
    amount: json['amount'] as num,
    counterpartyType: json['counterparty_type'] as String,
    country: json['country'] as String,
    limit: json['limit'] as int,
    localCurrency: json['local_currency'] as String,
    offset: json['offset'] as int,
    p2pAdvertList: json['p2p_advert_list'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertListRequestToJson(
        P2pAdvertListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'advertiser_id': instance.advertiserId,
      'amount': instance.amount,
      'counterparty_type': instance.counterpartyType,
      'country': instance.country,
      'limit': instance.limit,
      'local_currency': instance.localCurrency,
      'offset': instance.offset,
      'p2p_advert_list': instance.p2pAdvertList,
    };
