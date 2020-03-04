// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserUpdateResponse _$P2pAdvertiserUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserUpdateResponse(
    p2pAdvertiserUpdate: json['p2p_advertiser_update'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertiserUpdateResponseToJson(
        P2pAdvertiserUpdateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'p2p_advertiser_update': instance.p2pAdvertiserUpdate,
    };
