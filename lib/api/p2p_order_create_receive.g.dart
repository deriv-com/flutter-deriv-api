// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCreateResponse _$P2pOrderCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCreateResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pOrderCreate: json['p2p_order_create'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pOrderCreateResponseToJson(
        P2pOrderCreateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_order_create': instance.p2pOrderCreate,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
    };
