// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(Map<String, dynamic> json) {
  return ResetPasswordRequest(
    dateOfBirth: json['date_of_birth'] as String,
    newPassword: json['new_password'] as String,
    resetPassword: json['reset_password'] as int,
    verificationCode: json['verification_code'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'date_of_birth': instance.dateOfBirth,
      'new_password': instance.newPassword,
      'reset_password': instance.resetPassword,
      'verification_code': instance.verificationCode,
    };
