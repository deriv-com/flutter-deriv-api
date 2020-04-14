// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderListResponse _$P2pOrderListResponseFromJson(Map<String, dynamic> json) {
  return P2pOrderListResponse(
    p2pOrderList: json['p2p_order_list'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderListResponseToJson(
        P2pOrderListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_order_list': instance.p2pOrderList,
      'subscription': instance.subscription,
    };
