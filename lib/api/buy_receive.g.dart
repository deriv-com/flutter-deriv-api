// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyResponse _$BuyResponseFromJson(Map<String, dynamic> json) {
  return BuyResponse(
    buy: json['buy'] as Map<String, dynamic>,
    subscription: json['subscription'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$BuyResponseToJson(BuyResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'buy': instance.buy,
      'subscription': instance.subscription,
    };
