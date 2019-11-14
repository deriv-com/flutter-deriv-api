// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_history_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginHistoryResponse _$LoginHistoryResponseFromJson(Map<String, dynamic> json) {
  return LoginHistoryResponse()
    ..loginHistory =
        (json['login_history'] as List).map((e) => e as String).toList()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$LoginHistoryResponseToJson(
        LoginHistoryResponse instance) =>
    <String, dynamic>{
      'login_history': instance.loginHistory,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
