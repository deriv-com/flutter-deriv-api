// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_expired_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellExpiredRequest _$SellExpiredRequestFromJson(Map<String, dynamic> json) {
  return SellExpiredRequest(
    sellExpired: json['sell_expired'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellExpiredRequestToJson(SellExpiredRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'sell_expired': instance.sellExpired,
    };
