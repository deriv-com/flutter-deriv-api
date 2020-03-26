// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_durations_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingDurationsResponse _$TradingDurationsResponseFromJson(
    Map<String, dynamic> json) {
  return TradingDurationsResponse(
    tradingDurations: (json['trading_durations'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TradingDurationsResponseToJson(
        TradingDurationsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'trading_durations': instance.tradingDurations,
    };
