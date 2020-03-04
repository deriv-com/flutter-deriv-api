// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashierResponse _$CashierResponseFromJson(Map<String, dynamic> json) {
  return CashierResponse(
    cashier: json['cashier'] as String,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CashierResponseToJson(CashierResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'cashier': instance.cashier,
    };
