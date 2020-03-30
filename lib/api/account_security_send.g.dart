// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_security_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSecurityRequest _$AccountSecurityRequestFromJson(
    Map<String, dynamic> json) {
  return AccountSecurityRequest(
    accountSecurity: json['account_security'] as int,
    otp: json['otp'] as String,
    totpAction: json['totp_action'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AccountSecurityRequestToJson(
        AccountSecurityRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'account_security': instance.accountSecurity,
      'otp': instance.otp,
      'totp_action': instance.totpAction,
    };
