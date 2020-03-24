// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_cancel_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCancelRequest _$P2pOrderCancelRequestFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCancelRequest(
    id: json['id'] as String,
    p2pOrderCancel: json['p2p_order_cancel'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderCancelRequestToJson(
        P2pOrderCancelRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'id': instance.id,
      'p2p_order_cancel': instance.p2pOrderCancel,
    };
