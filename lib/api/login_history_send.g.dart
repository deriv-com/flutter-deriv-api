// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_history_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHistoryRequest _$LoginHistoryRequestFromJson(Map<String, dynamic> json) {
  return LoginHistoryRequest(
    limit: json['limit'] as int,
    loginHistory: json['login_history'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$LoginHistoryRequestToJson(
        LoginHistoryRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'limit': instance.limit,
      'login_history': instance.loginHistory,
    };
