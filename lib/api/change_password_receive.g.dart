// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordResponse _$ChangePasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordResponse(
    changePassword: json['change_password'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'change_password': instance.changePassword,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
