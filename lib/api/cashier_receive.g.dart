// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashierResponse _$CashierResponseFromJson(Map<String, dynamic> json) {
  return CashierResponse(
    cashier: json['cashier'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CashierResponseToJson(CashierResponse instance) =>
    <String, dynamic>{
      'cashier': instance.cashier,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
