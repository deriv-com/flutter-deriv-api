// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_cancel_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCancelResponse _$P2pOrderCancelResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCancelResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOrderCancel: json['p2p_order_cancel'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$P2pOrderCancelResponseToJson(
        P2pOrderCancelResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_order_cancel': instance.p2pOrderCancel,
      'req_id': instance.reqId,
    };
