// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserUpdateResponse _$P2pAdvertiserUpdateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserUpdateResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    p2pAdvertiserUpdate: json['p2p_advertiser_update'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertiserUpdateResponseToJson(
        P2pAdvertiserUpdateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'p2p_advertiser_update': instance.p2pAdvertiserUpdate,
      'req_id': instance.reqId,
    };
