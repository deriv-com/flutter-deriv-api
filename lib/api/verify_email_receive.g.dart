// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailResponse _$VerifyEmailResponseFromJson(Map<String, dynamic> json) {
  return VerifyEmailResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    verifyEmail: json['verify_email'] as int,
  );
}

Map<String, dynamic> _$VerifyEmailResponseToJson(
        VerifyEmailResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'verify_email': instance.verifyEmail,
    };
