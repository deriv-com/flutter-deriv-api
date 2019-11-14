// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_check_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordCheckRequest _$Mt5PasswordCheckRequestFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordCheckRequest()
    ..mt5PasswordCheck = json['mt5_password_check'] as int
    ..login = json['login'] as String
    ..password = json['password'] as String
    ..passwordType = json['password_type'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5PasswordCheckRequestToJson(
        Mt5PasswordCheckRequest instance) =>
    <String, dynamic>{
      'mt5_password_check': instance.mt5PasswordCheck,
      'login': instance.login,
      'password': instance.password,
      'password_type': instance.passwordType,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
