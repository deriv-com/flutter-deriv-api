// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_adverts_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserAdvertsRequest _$P2pAdvertiserAdvertsRequestFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserAdvertsRequest(
    limit: json['limit'] as int,
    offset: json['offset'] as int,
    p2pAdvertiserAdverts: json['p2p_advertiser_adverts'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertiserAdvertsRequestToJson(
        P2pAdvertiserAdvertsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'limit': instance.limit,
      'offset': instance.offset,
      'p2p_advertiser_adverts': instance.p2pAdvertiserAdverts,
    };
