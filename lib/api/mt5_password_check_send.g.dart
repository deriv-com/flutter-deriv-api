// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_check_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordCheckRequest _$Mt5PasswordCheckRequestFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordCheckRequest()
    ..login = json['login'] as String
    ..mt5PasswordCheck = json['mt5_password_check'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..password = json['password'] as String
    ..passwordType = json['password_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5PasswordCheckRequestToJson(
        Mt5PasswordCheckRequest instance) =>
    <String, dynamic>{
      'login': instance.login,
      'mt5_password_check': instance.mt5PasswordCheck,
      'passthrough': instance.passthrough,
      'password': instance.password,
      'password_type': instance.passwordType,
      'req_id': instance.reqId,
    };
