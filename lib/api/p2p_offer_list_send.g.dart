// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_offer_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOfferListRequest _$P2pOfferListRequestFromJson(Map<String, dynamic> json) {
  return P2pOfferListRequest(
    amount: json['amount'] as num,
    country: json['country'] as String,
    currency: json['currency'] as String,
    limit: json['limit'] as int,
    localCurrency: json['local_currency'] as String,
    offset: json['offset'] as int,
    p2pOfferList: json['p2p_offer_list'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$P2pOfferListRequestToJson(
        P2pOfferListRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'country': instance.country,
      'currency': instance.currency,
      'limit': instance.limit,
      'local_currency': instance.localCurrency,
      'offset': instance.offset,
      'p2p_offer_list': instance.p2pOfferList,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'type': instance.type,
    };
