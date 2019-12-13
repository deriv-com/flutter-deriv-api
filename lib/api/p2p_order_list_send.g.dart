// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderListRequest _$P2pOrderListRequestFromJson(Map<String, dynamic> json) {
  return P2pOrderListRequest(
    active: json['active'] as num,
    offerId: json['offer_id'] as String,
    p2pOrderList: json['p2p_order_list'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderListRequestToJson(
        P2pOrderListRequest instance) =>
    <String, dynamic>{
      'active': instance.active,
      'offer_id': instance.offerId,
      'p2p_order_list': instance.p2pOrderList,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
