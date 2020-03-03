// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_info_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderInfoResponse _$P2pOrderInfoResponseFromJson(Map<String, dynamic> json) {
  return P2pOrderInfoResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOrderInfo: json['p2p_order_info'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$P2pOrderInfoResponseToJson(
        P2pOrderInfoResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_order_info': instance.p2pOrderInfo,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
    };
