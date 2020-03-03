// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_apps_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthAppsResponse _$OauthAppsResponseFromJson(Map<String, dynamic> json) {
  return OauthAppsResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    oauthApps: (json['oauth_apps'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$OauthAppsResponseToJson(OauthAppsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'oauth_apps': instance.oauthApps,
    };
