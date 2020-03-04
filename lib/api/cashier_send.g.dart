// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashierRequest _$CashierRequestFromJson(Map<String, dynamic> json) {
  return CashierRequest(
    cashier: json['cashier'] as String,
    provider: json['provider'] as String,
    verificationCode: json['verification_code'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$CashierRequestToJson(CashierRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'cashier': instance.cashier,
      'provider': instance.provider,
      'verification_code': instance.verificationCode,
    };
