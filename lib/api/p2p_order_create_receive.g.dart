// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCreateResponse _$P2pOrderCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCreateResponse(
    p2pOrderCreate: json['p2p_order_create'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderCreateResponseToJson(
        P2pOrderCreateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'p2p_order_create': instance.p2pOrderCreate,
      'subscription': instance.subscription,
    };
