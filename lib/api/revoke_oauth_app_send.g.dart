// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_oauth_app_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeOauthAppRequest _$RevokeOauthAppRequestFromJson(
    Map<String, dynamic> json) {
  return RevokeOauthAppRequest(
    revokeOauthApp: json['revoke_oauth_app'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$RevokeOauthAppRequestToJson(
        RevokeOauthAppRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'revoke_oauth_app': instance.revokeOauthApp,
    };
