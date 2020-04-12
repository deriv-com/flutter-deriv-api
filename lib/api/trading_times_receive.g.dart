// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_times_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingTimesResponse _$TradingTimesResponseFromJson(Map<String, dynamic> json) {
  return TradingTimesResponse(
    tradingTimes: json['trading_times'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TradingTimesResponseToJson(
        TradingTimesResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'trading_times': instance.tradingTimes,
    };
