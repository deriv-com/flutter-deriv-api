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
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RevokeOauthAppResponseToJson(
        RevokeOauthAppResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'revoke_oauth_app': instance.revokeOauthApp,
    };
