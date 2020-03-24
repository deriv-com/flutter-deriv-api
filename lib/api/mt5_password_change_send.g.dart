// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_change_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordChangeRequest _$Mt5PasswordChangeRequestFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordChangeRequest(
    login: json['login'] as String,
    mt5PasswordChange: json['mt5_password_change'] as int,
    newPassword: json['new_password'] as String,
    oldPassword: json['old_password'] as String,
    passwordType: json['password_type'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$Mt5PasswordChangeRequestToJson(
        Mt5PasswordChangeRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'login': instance.login,
      'mt5_password_change': instance.mt5PasswordChange,
      'new_password': instance.newPassword,
      'old_password': instance.oldPassword,
      'password_type': instance.passwordType,
    };
