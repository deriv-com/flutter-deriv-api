// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_history_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHistoryRequest _$LoginHistoryRequestFromJson(Map<String, dynamic> json) {
  return LoginHistoryRequest(
    limit: json['limit'] as int,
    loginHistory: json['login_history'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$LoginHistoryRequestToJson(
        LoginHistoryRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'limit': instance.limit,
      'login_history': instance.loginHistory,
    };
