// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_update_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderUpdateRequest _$P2pOrderUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pOrderUpdateRequest(
    orderId: json['order_id'] as String,
    p2pOrderUpdate: json['p2p_order_update'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$P2pOrderUpdateRequestToJson(
        P2pOrderUpdateRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'p2p_order_update': instance.p2pOrderUpdate,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'status': instance.status,
    };
