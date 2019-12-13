// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellRequest _$SellRequestFromJson(Map<String, dynamic> json) {
  return SellRequest(
    passthrough: json['passthrough'] as Map<String, dynamic>,
    price: json['price'] as num,
    reqId: json['req_id'] as int,
    sell: json['sell'] as int,
  );
}

Map<String, dynamic> _$SellRequestToJson(SellRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'price': instance.price,
      'req_id': instance.reqId,
      'sell': instance.sell,
    };
