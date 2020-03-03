// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_expired_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellExpiredResponse _$SellExpiredResponseFromJson(Map<String, dynamic> json) {
  return SellExpiredResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    sellExpired: json['sell_expired'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$SellExpiredResponseToJson(
        SellExpiredResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'sell_expired': instance.sellExpired,
    };
