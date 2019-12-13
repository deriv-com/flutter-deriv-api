// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_order_create_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

P2pOrderCreateRequest _$P2pOrderCreateRequestFromJson(
    Map<String, dynamic> json) {
  return P2pOrderCreateRequest(
    amount: json['amount'] as num,
    offerId: json['offer_id'] as String,
    p2pOrderCreate: json['p2p_order_create'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$P2pOrderCreateRequestToJson(
        P2pOrderCreateRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'offer_id': instance.offerId,
      'p2p_order_create': instance.p2pOrderCreate,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
