// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_chat_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pChatCreateResponse _$P2pChatCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pChatCreateResponse(
    p2pChatCreate: json['p2p_chat_create'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pChatCreateResponseToJson(
        P2pChatCreateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_chat_create': instance.p2pChatCreate,
    };
