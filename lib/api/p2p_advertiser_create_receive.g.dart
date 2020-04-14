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
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertiserCreateResponseToJson(
        P2pAdvertiserCreateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'p2p_advertiser_create': instance.p2pAdvertiserCreate,
      'subscription': instance.subscription,
    };
