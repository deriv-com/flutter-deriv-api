// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_apps_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthAppsResponse _$OauthAppsResponseFromJson(Map<String, dynamic> json) {
  return OauthAppsResponse(
    oauthApps: (json['oauth_apps'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$OauthAppsResponseToJson(OauthAppsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'oauth_apps': instance.oauthApps,
    };
