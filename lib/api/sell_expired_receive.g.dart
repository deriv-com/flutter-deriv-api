// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_expired_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellExpiredResponse _$SellExpiredResponseFromJson(Map<String, dynamic> json) {
  return SellExpiredResponse(
    sellExpired: json['sell_expired'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellExpiredResponseToJson(
        SellExpiredResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'sell_expired': instance.sellExpired,
    };
