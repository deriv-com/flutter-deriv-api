// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(Map<String, dynamic> json) {
  return ResetPasswordRequest(
    dateOfBirth: json['date_of_birth'] as String,
    newPassword: json['new_password'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    resetPassword: json['reset_password'] as int,
    verificationCode: json['verification_code'] as String,
  );
}

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'date_of_birth': instance.dateOfBirth,
      'new_password': instance.newPassword,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'reset_password': instance.resetPassword,
      'verification_code': instance.verificationCode,
    };
