// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertListResponse _$P2pAdvertListResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertListResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pAdvertList: json['p2p_advert_list'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$P2pAdvertListResponseToJson(
        P2pAdvertListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_advert_list': instance.p2pAdvertList,
      'req_id': instance.reqId,
    };
