// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertCreateResponse _$P2pAdvertCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertCreateResponse(
    p2pAdvertCreate: json['p2p_advert_create'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertCreateResponseToJson(
        P2pAdvertCreateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_advert_create': instance.p2pAdvertCreate,
    };
