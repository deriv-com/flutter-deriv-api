// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_cancel_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCancelResponse _$P2pOrderCancelResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCancelResponse(
    p2pOrderCancel: json['p2p_order_cancel'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderCancelResponseToJson(
        P2pOrderCancelResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_order_cancel': instance.p2pOrderCancel,
    };
