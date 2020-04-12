// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_change_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordChangeResponse _$Mt5PasswordChangeResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordChangeResponse(
    mt5PasswordChange: json['mt5_password_change'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5PasswordChangeResponseToJson(
        Mt5PasswordChangeResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'mt5_password_change': instance.mt5PasswordChange,
    };
