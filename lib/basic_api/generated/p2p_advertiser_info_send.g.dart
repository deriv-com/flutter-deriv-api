// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_info_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserInfoRequest _$P2pAdvertiserInfoRequestFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserInfoRequest(
    id: json['id'] as String,
    p2pAdvertiserInfo: json['p2p_advertiser_info'] as int,
    subscribe: json['subscribe'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertiserInfoRequestToJson(
        P2pAdvertiserInfoRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'id': instance.id,
      'p2p_advertiser_info': instance.p2pAdvertiserInfo,
      'subscribe': instance.subscribe,
    };
