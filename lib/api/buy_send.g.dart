// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyRequest _$BuyRequestFromJson(Map<String, dynamic> json) {
  return BuyRequest()
    ..buy = json['buy'] as String
    ..parameters = json['parameters'] as Map<String, dynamic>
    ..price = json['price'] as num
    ..subscribe = json['subscribe'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$BuyRequestToJson(BuyRequest instance) =>
    <String, dynamic>{
      'buy': instance.buy,
      'parameters': instance.parameters,
      'price': instance.price,
      'subscribe': instance.subscribe,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
