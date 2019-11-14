// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellRequest _$SellRequestFromJson(Map<String, dynamic> json) {
  return SellRequest()
    ..sell = json['sell'] as int
    ..price = json['price'] as num
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$SellRequestToJson(SellRequest instance) =>
    <String, dynamic>{
      'sell': instance.sell,
      'price': instance.price,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
