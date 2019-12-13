// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_security_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSecurityResponse _$AccountSecurityResponseFromJson(
    Map<String, dynamic> json) {
  return AccountSecurityResponse(
    accountSecurity: json['account_security'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AccountSecurityResponseToJson(
        AccountSecurityResponse instance) =>
    <String, dynamic>{
      'account_security': instance.accountSecurity,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
