// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_durations_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingDurationsResponse _$TradingDurationsResponseFromJson(
    Map<String, dynamic> json) {
  return TradingDurationsResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    tradingDurations: (json['trading_durations'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TradingDurationsResponseToJson(
        TradingDurationsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'trading_durations': instance.tradingDurations,
    };
