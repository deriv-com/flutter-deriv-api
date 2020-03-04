// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_confirm_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderConfirmResponse _$P2pOrderConfirmResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderConfirmResponse(
    p2pOrderConfirm: json['p2p_order_confirm'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderConfirmResponseToJson(
        P2pOrderConfirmResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'p2p_order_confirm': instance.p2pOrderConfirm,
    };
