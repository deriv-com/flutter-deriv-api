// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trading_times_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradingTimesResponse _$TradingTimesResponseFromJson(Map<String, dynamic> json) {
  return TradingTimesResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int
    ..tradingTimes = json['trading_times'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TradingTimesResponseToJson(
        TradingTimesResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'trading_times': instance.tradingTimes,
    };
