// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_times_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingTimesResponse _$TradingTimesResponseFromJson(Map<String, dynamic> json) {
  return TradingTimesResponse(
    tradingTimes: json['trading_times'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TradingTimesResponseToJson(
        TradingTimesResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'trading_times': instance.tradingTimes,
    };
