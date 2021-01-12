// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ohlc_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OHLCResponse _$OHLCResponseFromJson(Map<String, dynamic> json) {
  return OHLCResponse(
    subscription: json['subscription'] as Map<String, dynamic>,
    ohlc: json['ohlc'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$OHLCResponseToJson(OHLCResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
      'ohlc': instance.ohlc,
    };
