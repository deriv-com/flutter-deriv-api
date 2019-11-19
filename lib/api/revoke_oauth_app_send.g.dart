// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_oauth_app_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeOauthAppRequest _$RevokeOauthAppRequestFromJson(
    Map<String, dynamic> json) {
  return RevokeOauthAppRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int
    ..revokeOauthApp = json['revoke_oauth_app'] as int;
}

Map<String, dynamic> _$RevokeOauthAppRequestToJson(
        RevokeOauthAppRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'revoke_oauth_app': instance.revokeOauthApp,
    };
