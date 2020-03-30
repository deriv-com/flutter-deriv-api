// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_times_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingTimesRequest _$TradingTimesRequestFromJson(Map<String, dynamic> json) {
  return TradingTimesRequest(
    tradingTimes: json['trading_times'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$TradingTimesRequestToJson(
        TradingTimesRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'trading_times': instance.tradingTimes,
    };
