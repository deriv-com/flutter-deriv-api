// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashierRequest _$CashierRequestFromJson(Map<String, dynamic> json) {
  return CashierRequest(
    cashier: json['cashier'] as String,
    provider: json['provider'] as String,
    type: json['type'] as String,
    verificationCode: json['verification_code'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$CashierRequestToJson(CashierRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'cashier': instance.cashier,
      'provider': instance.provider,
      'type': instance.type,
      'verification_code': instance.verificationCode,
    };
