// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_reset_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordResetResponse _$Mt5PasswordResetResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordResetResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    mt5PasswordReset: json['mt5_password_reset'] as int,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$Mt5PasswordResetResponseToJson(
        Mt5PasswordResetResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'mt5_password_reset': instance.mt5PasswordReset,
      'req_id': instance.reqId,
    };
