// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_reset_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordResetResponse _$Mt5PasswordResetResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordResetResponse(
    mt5PasswordReset: json['mt5_password_reset'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5PasswordResetResponseToJson(
        Mt5PasswordResetResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'mt5_password_reset': instance.mt5PasswordReset,
    };
