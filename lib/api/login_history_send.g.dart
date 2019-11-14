// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_history_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHistoryRequest _$LoginHistoryRequestFromJson(Map<String, dynamic> json) {
  return LoginHistoryRequest()
    ..loginHistory = json['login_history'] as int
    ..limit = json['limit'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$LoginHistoryRequestToJson(
        LoginHistoryRequest instance) =>
    <String, dynamic>{
      'login_history': instance.loginHistory,
      'limit': instance.limit,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
