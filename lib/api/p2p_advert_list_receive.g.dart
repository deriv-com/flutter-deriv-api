// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertListResponse _$P2pAdvertListResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertListResponse(
    p2pAdvertList: json['p2p_advert_list'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertListResponseToJson(
        P2pAdvertListResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_advert_list': instance.p2pAdvertList,
    };
