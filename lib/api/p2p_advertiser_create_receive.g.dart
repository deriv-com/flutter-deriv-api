// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_create_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserCreateResponse _$P2pAdvertiserCreateResponseFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserCreateResponse(
    p2pAdvertiserCreate: json['p2p_advertiser_create'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertiserCreateResponseToJson(
        P2pAdvertiserCreateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'p2p_advertiser_create': instance.p2pAdvertiserCreate,
      'subscription': instance.subscription,
    };
