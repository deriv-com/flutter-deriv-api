// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordRequest(
    changePassword: json['change_password'] as num,
    newPassword: json['new_password'] as String,
    oldPassword: json['old_password'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'change_password': instance.changePassword,
      'new_password': instance.newPassword,
      'old_password': instance.oldPassword,
    };
