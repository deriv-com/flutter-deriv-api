// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_password_check_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5PasswordCheckResponse _$Mt5PasswordCheckResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5PasswordCheckResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..mt5PasswordCheck = json['mt5_password_check'] as int
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5PasswordCheckResponseToJson(
        Mt5PasswordCheckResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'mt5_password_check': instance.mt5PasswordCheck,
      'req_id': instance.reqId,
    };
