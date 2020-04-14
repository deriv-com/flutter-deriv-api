// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellResponse _$SellResponseFromJson(Map<String, dynamic> json) {
  return SellResponse(
    sell: json['sell'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$SellResponseToJson(SellResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'sell': instance.sell,
    };
