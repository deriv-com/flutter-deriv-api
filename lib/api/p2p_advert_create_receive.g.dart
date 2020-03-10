// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertCreateResponse _$P2pAdvertCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertCreateResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pAdvertCreate: json['p2p_advert_create'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertCreateResponseToJson(
        P2pAdvertCreateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_advert_create': instance.p2pAdvertCreate,
      'req_id': instance.reqId,
    };
