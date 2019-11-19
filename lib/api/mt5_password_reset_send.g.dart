// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_reset_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordResetRequest _$Mt5PasswordResetRequestFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordResetRequest()
    ..login = json['login'] as String
    ..mt5PasswordReset = json['mt5_password_reset'] as int
    ..newPassword = json['new_password'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..passwordType = json['password_type'] as String
    ..reqId = json['req_id'] as int
    ..verificationCode = json['verification_code'] as String;
}

Map<String, dynamic> _$Mt5PasswordResetRequestToJson(
        Mt5PasswordResetRequest instance) =>
    <String, dynamic>{
      'login': instance.login,
      'mt5_password_reset': instance.mt5PasswordReset,
      'new_password': instance.newPassword,
      'passthrough': instance.passthrough,
      'password_type': instance.passwordType,
      'req_id': instance.reqId,
      'verification_code': instance.verificationCode,
    };
