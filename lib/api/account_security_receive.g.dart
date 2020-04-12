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
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AccountSecurityResponseToJson(
        AccountSecurityResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'account_security': instance.accountSecurity,
    };
