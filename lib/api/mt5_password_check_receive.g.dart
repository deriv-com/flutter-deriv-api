// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_check_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordCheckResponse _$Mt5PasswordCheckResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordCheckResponse()
    ..mt5PasswordCheck = json['mt5_password_check'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5PasswordCheckResponseToJson(
        Mt5PasswordCheckResponse instance) =>
    <String, dynamic>{
      'mt5_password_check': instance.mt5PasswordCheck,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
