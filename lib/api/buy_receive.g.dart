// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyResponse _$BuyResponseFromJson(Map<String, dynamic> json) {
  return BuyResponse(
    buy: json['buy'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$BuyResponseToJson(BuyResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'buy': instance.buy,
      'subscription': instance.subscription,
    };
