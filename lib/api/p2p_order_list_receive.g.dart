// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderListResponse _$P2pOrderListResponseFromJson(Map<String, dynamic> json) {
  return P2pOrderListResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOrderList: json['p2p_order_list'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderListResponseToJson(
        P2pOrderListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_order_list': instance.p2pOrderList,
      'req_id': instance.reqId,
    };
