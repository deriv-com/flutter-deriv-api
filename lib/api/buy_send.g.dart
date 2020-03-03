// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyRequest _$BuyRequestFromJson(Map<String, dynamic> json) {
  return BuyRequest(
    buy: json['buy'] as String,
    parameters: json['parameters'] as Map<String, dynamic>,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    price: json['price'] as num,
    reqId: json['req_id'] as int,
    subscribe: json['subscribe'] as int,
  );
}

Map<String, dynamic> _$BuyRequestToJson(BuyRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'buy': instance.buy,
      'parameters': instance.parameters,
      'price': instance.price,
      'subscribe': instance.subscribe,
    };
