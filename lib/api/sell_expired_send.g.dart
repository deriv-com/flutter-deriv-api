// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_expired_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellExpiredRequest _$SellExpiredRequestFromJson(Map<String, dynamic> json) {
  return SellExpiredRequest(
    sellExpired: json['sell_expired'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$SellExpiredRequestToJson(SellExpiredRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'sell_expired': instance.sellExpired,
    };
