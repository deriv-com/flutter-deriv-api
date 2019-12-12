// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderUpdateResponse _$P2pOrderUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderUpdateResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOrderUpdate: json['p2p_order_update'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderUpdateResponseToJson(
        P2pOrderUpdateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_order_update': instance.p2pOrderUpdate,
      'req_id': instance.reqId,
    };
