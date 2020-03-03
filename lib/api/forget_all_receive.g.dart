// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_all_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetAllResponse _$ForgetAllResponseFromJson(Map<String, dynamic> json) {
  return ForgetAllResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    forgetAll: (json['forget_all'] as List).map((e) => e as String).toList(),
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ForgetAllResponseToJson(ForgetAllResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'forget_all': instance.forgetAll,
    };
