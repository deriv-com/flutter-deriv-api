// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellResponse _$SellResponseFromJson(Map<String, dynamic> json) {
  return SellResponse(
    sell: json['sell'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SellResponseToJson(SellResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'sell': instance.sell,
    };
