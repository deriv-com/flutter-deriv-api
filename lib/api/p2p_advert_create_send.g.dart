// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_advert_create_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pAdvertCreateRequest _$P2pAdvertCreateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pAdvertCreateRequest(
    amount: json['amount'] as num,
    contactInfo: json['contact_info'] as String,
    country: json['country'] as String,
    description: json['description'] as String,
    localCurrency: json['local_currency'] as String,
    maxOrderAmount: json['max_order_amount'] as num,
    minOrderAmount: json['min_order_amount'] as num,
    p2pAdvertCreate: json['p2p_advert_create'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    paymentInfo: json['payment_info'] as String,
    paymentMethod: json['payment_method'] as String,
    rate: json['rate'] as num,
    reqId: json['req_id'] as int,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$P2pAdvertCreateRequestToJson(
        P2pAdvertCreateRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'contact_info': instance.contactInfo,
      'country': instance.country,
      'description': instance.description,
      'local_currency': instance.localCurrency,
      'max_order_amount': instance.maxOrderAmount,
      'min_order_amount': instance.minOrderAmount,
      'p2p_advert_create': instance.p2pAdvertCreate,
      'passthrough': instance.passthrough,
      'payment_info': instance.paymentInfo,
      'payment_method': instance.paymentMethod,
      'rate': instance.rate,
      'req_id': instance.reqId,
      'type': instance.type,
    };
