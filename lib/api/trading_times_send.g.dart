// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_times_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingTimesRequest _$TradingTimesRequestFromJson(Map<String, dynamic> json) {
  return TradingTimesRequest(
    tradingTimes: json['trading_times'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TradingTimesRequestToJson(
        TradingTimesRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'trading_times': instance.tradingTimes,
    };
