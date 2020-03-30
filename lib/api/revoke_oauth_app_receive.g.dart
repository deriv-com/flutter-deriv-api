// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_oauth_app_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeOauthAppResponse _$RevokeOauthAppResponseFromJson(
    Map<String, dynamic> json) {
  return RevokeOauthAppResponse(
    revokeOauthApp: json['revoke_oauth_app'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$RevokeOauthAppResponseToJson(
        RevokeOauthAppResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'revoke_oauth_app': instance.revokeOauthApp,
    };
