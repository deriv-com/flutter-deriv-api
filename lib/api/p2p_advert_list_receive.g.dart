// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertListResponse _$P2pAdvertListResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertListResponse(
    p2pAdvertList: json['p2p_advert_list'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertListResponseToJson(
        P2pAdvertListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_advert_list': instance.p2pAdvertList,
    };
