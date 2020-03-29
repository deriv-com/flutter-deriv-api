// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_update_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserUpdateRequest _$P2pAdvertiserUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserUpdateRequest(
    contactInfo: json['contact_info'] as String,
    defaultAdvertDescription: json['default_advert_description'] as String,
    isListed: json['is_listed'] as int,
    name: json['name'] as String,
    p2pAdvertiserUpdate: json['p2p_advertiser_update'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    paymentInfo: json['payment_info'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pAdvertiserUpdateRequestToJson(
        P2pAdvertiserUpdateRequest instance) =>
    <String, dynamic>{
      'contact_info': instance.contactInfo,
      'default_advert_description': instance.defaultAdvertDescription,
      'is_listed': instance.isListed,
      'name': instance.name,
      'p2p_advertiser_update': instance.p2pAdvertiserUpdate,
      'passthrough': instance.passthrough,
      'payment_info': instance.paymentInfo,
      'req_id': instance.reqId,
    };
