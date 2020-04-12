// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertCreateResponse _$P2pAdvertCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertCreateResponse(
    p2pAdvertCreate: json['p2p_advert_create'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertCreateResponseToJson(
        P2pAdvertCreateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_advert_create': instance.p2pAdvertCreate,
    };
