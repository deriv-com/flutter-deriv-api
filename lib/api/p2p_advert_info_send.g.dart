// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_info_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertInfoRequest _$P2pAdvertInfoRequestFromJson(Map<String, dynamic> json) {
  return P2pAdvertInfoRequest(
    id: json['id'] as String,
    p2pAdvertInfo: json['p2p_advert_info'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertInfoRequestToJson(
        P2pAdvertInfoRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'id': instance.id,
      'p2p_advert_info': instance.p2pAdvertInfo,
    };
