// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_create_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCreateRequest _$P2pOrderCreateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCreateRequest(
    advertId: json['advert_id'] as String,
    amount: json['amount'] as num,
    contactInfo: json['contact_info'] as String,
    p2pOrderCreate: json['p2p_order_create'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    paymentInfo: json['payment_info'] as String,
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
  );
}

Map<String, dynamic> _$P2pOrderCreateRequestToJson(
        P2pOrderCreateRequest instance) =>
    <String, dynamic>{
      'advert_id': instance.advertId,
      'amount': instance.amount,
      'contact_info': instance.contactInfo,
      'p2p_order_create': instance.p2pOrderCreate,
      'passthrough': instance.passthrough,
      'payment_info': instance.paymentInfo,
      'req_id': instance.reqId,
      'subscribe': instance.subscribe,
    };
