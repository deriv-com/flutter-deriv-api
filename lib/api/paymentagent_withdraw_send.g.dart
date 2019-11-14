// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_withdraw_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentWithdrawRequest _$PaymentagentWithdrawRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentWithdrawRequest()
    ..paymentagentWithdraw = json['paymentagent_withdraw'] as int
    ..description = json['description'] as String
    ..amount = json['amount'] as num
    ..currency = json['currency'] as String
    ..dryRun = json['dry_run'] as int
    ..paymentagentLoginid = json['paymentagent_loginid'] as String
    ..verificationCode = json['verification_code'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PaymentagentWithdrawRequestToJson(
        PaymentagentWithdrawRequest instance) =>
    <String, dynamic>{
      'paymentagent_withdraw': instance.paymentagentWithdraw,
      'description': instance.description,
      'amount': instance.amount,
      'currency': instance.currency,
      'dry_run': instance.dryRun,
      'paymentagent_loginid': instance.paymentagentLoginid,
      'verification_code': instance.verificationCode,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
