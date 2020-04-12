// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_check_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordCheckResponse _$Mt5PasswordCheckResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordCheckResponse(
    mt5PasswordCheck: json['mt5_password_check'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5PasswordCheckResponseToJson(
        Mt5PasswordCheckResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'mt5_password_check': instance.mt5PasswordCheck,
    };
