// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_info_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderInfoRequest _$P2pOrderInfoRequestFromJson(Map<String, dynamic> json) {
  return P2pOrderInfoRequest(
    orderId: json['order_id'] as String,
    p2pOrderInfo: json['p2p_order_info'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderInfoRequestToJson(
        P2pOrderInfoRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'p2p_order_info': instance.p2pOrderInfo,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
