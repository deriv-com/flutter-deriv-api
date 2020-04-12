// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_durations_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingDurationsResponse _$TradingDurationsResponseFromJson(
    Map<String, dynamic> json) {
  return TradingDurationsResponse(
    tradingDurations: (json['trading_durations'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TradingDurationsResponseToJson(
        TradingDurationsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'trading_durations': instance.tradingDurations,
    };
