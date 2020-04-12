// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advertiser_create_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertiserCreateRequest _$P2pAdvertiserCreateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertiserCreateRequest(
    contactInfo: json['contact_info'] as String,
    defaultAdvertDescription: json['default_advert_description'] as String,
    name: json['name'] as String,
    p2pAdvertiserCreate: json['p2p_advertiser_create'] as int,
    paymentInfo: json['payment_info'] as String,
    subscribe: json['subscribe'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$P2pAdvertiserCreateRequestToJson(
        P2pAdvertiserCreateRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'contact_info': instance.contactInfo,
      'default_advert_description': instance.defaultAdvertDescription,
      'name': instance.name,
      'p2p_advertiser_create': instance.p2pAdvertiserCreate,
      'payment_info': instance.paymentInfo,
      'subscribe': instance.subscribe,
    };
