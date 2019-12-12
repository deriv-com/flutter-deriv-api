// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_confirm_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderConfirmResponse _$P2pOrderConfirmResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderConfirmResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOrderConfirm: json['p2p_order_confirm'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderConfirmResponseToJson(
        P2pOrderConfirmResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_order_confirm': instance.p2pOrderConfirm,
      'req_id': instance.reqId,
    };
