// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_apps_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthAppsRequest _$OauthAppsRequestFromJson(Map<String, dynamic> json) {
  return OauthAppsRequest(
    oauthApps: json['oauth_apps'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$OauthAppsRequestToJson(OauthAppsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'oauth_apps': instance.oauthApps,
    };
