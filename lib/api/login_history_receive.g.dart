// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_history_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHistoryResponse _$LoginHistoryResponseFromJson(Map<String, dynamic> json) {
  return LoginHistoryResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    loginHistory: (json['login_history'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$LoginHistoryResponseToJson(
        LoginHistoryResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'login_history': instance.loginHistory,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
