// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_withdraw_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentWithdrawRequest _$PaymentagentWithdrawRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentWithdrawRequest(
    amount: json['amount'] as num,
    currency: json['currency'] as String,
    description: json['description'] as String,
    dryRun: json['dry_run'] as int,
    paymentagentLoginid: json['paymentagent_loginid'] as String,
    paymentagentWithdraw: json['paymentagent_withdraw'] as int,
    verificationCode: json['verification_code'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$PaymentagentWithdrawRequestToJson(
        PaymentagentWithdrawRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'amount': instance.amount,
      'currency': instance.currency,
      'description': instance.description,
      'dry_run': instance.dryRun,
      'paymentagent_loginid': instance.paymentagentLoginid,
      'paymentagent_withdraw': instance.paymentagentWithdraw,
      'verification_code': instance.verificationCode,
    };
