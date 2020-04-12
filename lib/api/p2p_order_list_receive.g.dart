// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderListResponse _$P2pOrderListResponseFromJson(Map<String, dynamic> json) {
  return P2pOrderListResponse(
    p2pOrderList: json['p2p_order_list'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderListResponseToJson(
        P2pOrderListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_order_list': instance.p2pOrderList,
      'subscription': instance.subscription,
    };
