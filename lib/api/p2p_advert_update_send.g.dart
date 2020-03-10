// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_update_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertUpdateRequest _$P2pAdvertUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertUpdateRequest(
    delete: json['delete'] as int,
    id: json['id'] as String,
    isActive: json['is_active'] as int,
    p2pAdvertUpdate: json['p2p_advert_update'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertUpdateRequestToJson(
        P2pAdvertUpdateRequest instance) =>
    <String, dynamic>{
      'delete': instance.delete,
      'id': instance.id,
      'is_active': instance.isActive,
      'p2p_advert_update': instance.p2pAdvertUpdate,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
