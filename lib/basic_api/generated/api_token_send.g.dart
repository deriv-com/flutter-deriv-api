// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiTokenRequest _$ApiTokenRequestFromJson(Map<String, dynamic> json) {
  return ApiTokenRequest(
    apiToken: json['api_token'] as int,
    deleteToken: json['delete_token'] as String,
    newToken: json['new_token'] as String,
    newTokenScopes:
        (json['new_token_scopes'] as List)?.map((e) => e as String)?.toList(),
    validForCurrentIpOnly: json['valid_for_current_ip_only'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ApiTokenRequestToJson(ApiTokenRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'api_token': instance.apiToken,
      'delete_token': instance.deleteToken,
      'new_token': instance.newToken,
      'new_token_scopes': instance.newTokenScopes,
      'valid_for_current_ip_only': instance.validForCurrentIpOnly,
    };
