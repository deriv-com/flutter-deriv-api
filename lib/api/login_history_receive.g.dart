// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_history_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHistoryResponse _$LoginHistoryResponseFromJson(Map<String, dynamic> json) {
  return LoginHistoryResponse(
    loginHistory: (json['login_history'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$LoginHistoryResponseToJson(
        LoginHistoryResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'login_history': instance.loginHistory,
    };
