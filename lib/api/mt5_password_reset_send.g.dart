// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_reset_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordResetRequest _$Mt5PasswordResetRequestFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordResetRequest(
    login: json['login'] as String,
    mt5PasswordReset: json['mt5_password_reset'] as int,
    newPassword: json['new_password'] as String,
    passwordType: json['password_type'] as String,
    verificationCode: json['verification_code'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5PasswordResetRequestToJson(
        Mt5PasswordResetRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'login': instance.login,
      'mt5_password_reset': instance.mt5PasswordReset,
      'new_password': instance.newPassword,
      'password_type': instance.passwordType,
      'verification_code': instance.verificationCode,
    };
