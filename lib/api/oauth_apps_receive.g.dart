// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_apps_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthAppsResponse _$OauthAppsResponseFromJson(Map<String, dynamic> json) {
  return OauthAppsResponse()
    ..oauthApps = (json['oauth_apps'] as List).map((e) => e as String).toList()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$OauthAppsResponseToJson(OauthAppsResponse instance) =>
    <String, dynamic>{
      'oauth_apps': instance.oauthApps,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
