// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailResponse _$VerifyEmailResponseFromJson(Map<String, dynamic> json) {
  return VerifyEmailResponse(
    verifyEmail: json['verify_email'] as int,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$VerifyEmailResponseToJson(
        VerifyEmailResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'verify_email': instance.verifyEmail,
    };
