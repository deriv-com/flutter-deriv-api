// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_expired_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellExpiredResponse _$SellExpiredResponseFromJson(Map<String, dynamic> json) {
  return SellExpiredResponse(
    sellExpired: json['sell_expired'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$SellExpiredResponseToJson(
        SellExpiredResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'sell_expired': instance.sellExpired,
    };
