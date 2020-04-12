// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellRequest _$SellRequestFromJson(Map<String, dynamic> json) {
  return SellRequest(
    price: json['price'] as num,
    sell: json['sell'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellRequestToJson(SellRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'price': instance.price,
      'sell': instance.sell,
    };
