// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_oauth_app_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeOauthAppResponse _$RevokeOauthAppResponseFromJson(
    Map<String, dynamic> json) {
  return RevokeOauthAppResponse(
    revokeOauthApp: json['revoke_oauth_app'] as int,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RevokeOauthAppResponseToJson(
        RevokeOauthAppResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'revoke_oauth_app': instance.revokeOauthApp,
    };
