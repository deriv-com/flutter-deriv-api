// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_cancel_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCancelResponse _$P2pOrderCancelResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCancelResponse(
    p2pOrderCancel: json['p2p_order_cancel'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderCancelResponseToJson(
        P2pOrderCancelResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_order_cancel': instance.p2pOrderCancel,
    };
