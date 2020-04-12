// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderListRequest _$P2pOrderListRequestFromJson(Map<String, dynamic> json) {
  return P2pOrderListRequest(
    active: json['active'] as num,
    advertId: json['advert_id'] as String,
    limit: json['limit'] as int,
    offset: json['offset'] as int,
    p2pOrderList: json['p2p_order_list'] as int,
    subscribe: json['subscribe'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderListRequestToJson(
        P2pOrderListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'active': instance.active,
      'advert_id': instance.advertId,
      'limit': instance.limit,
      'offset': instance.offset,
      'p2p_order_list': instance.p2pOrderList,
      'subscribe': instance.subscribe,
    };
