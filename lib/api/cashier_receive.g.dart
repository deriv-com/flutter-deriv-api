// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashierResponse _$CashierResponseFromJson(Map<String, dynamic> json) {
  return CashierResponse(
    cashier: json['cashier'] as String,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CashierResponseToJson(CashierResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'cashier': instance.cashier,
    };
