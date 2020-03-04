// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_info_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderInfoRequest _$P2pOrderInfoRequestFromJson(Map<String, dynamic> json) {
  return P2pOrderInfoRequest(
    id: json['id'] as String,
    p2pOrderInfo: json['p2p_order_info'] as int,
    subscribe: json['subscribe'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderInfoRequestToJson(
        P2pOrderInfoRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'id': instance.id,
      'p2p_order_info': instance.p2pOrderInfo,
      'subscribe': instance.subscribe,
    };
