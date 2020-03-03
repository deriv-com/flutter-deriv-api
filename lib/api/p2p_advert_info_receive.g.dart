// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_info_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertInfoResponse _$P2pAdvertInfoResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertInfoResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pAdvertInfo: json['p2p_advert_info'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$P2pAdvertInfoResponseToJson(
        P2pAdvertInfoResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'p2p_advert_info': instance.p2pAdvertInfo,
    };
