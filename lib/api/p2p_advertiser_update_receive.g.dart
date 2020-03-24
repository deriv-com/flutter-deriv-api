// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserUpdateResponse _$P2pAdvertiserUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserUpdateResponse(
    p2pAdvertiserUpdate: json['p2p_advertiser_update'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertiserUpdateResponseToJson(
        P2pAdvertiserUpdateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_advertiser_update': instance.p2pAdvertiserUpdate,
    };
