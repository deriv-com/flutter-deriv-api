// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponse _$ResetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ResetPasswordResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    resetPassword: json['reset_password'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ResetPasswordResponseToJson(
        ResetPasswordResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'reset_password': instance.resetPassword,
    };
