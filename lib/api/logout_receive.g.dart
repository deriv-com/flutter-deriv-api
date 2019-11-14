// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) {
  return LogoutResponse()
    ..logout = json['logout'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'logout': instance.logout,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
