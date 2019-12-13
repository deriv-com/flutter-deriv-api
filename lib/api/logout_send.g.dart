// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutRequest _$LogoutRequestFromJson(Map<String, dynamic> json) {
  return LogoutRequest(
    logout: json['logout'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$LogoutRequestToJson(LogoutRequest instance) =>
    <String, dynamic>{
      'logout': instance.logout,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
