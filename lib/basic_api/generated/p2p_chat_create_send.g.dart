// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_chat_create_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pChatCreateRequest _$P2pChatCreateRequestFromJson(Map<String, dynamic> json) {
  return P2pChatCreateRequest(
    orderId: json['order_id'] as String,
    p2pChatCreate: json['p2p_chat_create'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pChatCreateRequestToJson(
        P2pChatCreateRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'order_id': instance.orderId,
      'p2p_chat_create': instance.p2pChatCreate,
    };
