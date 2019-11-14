// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_all_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetAllResponse _$ForgetAllResponseFromJson(Map<String, dynamic> json) {
  return ForgetAllResponse()
    ..forgetAll = (json['forget_all'] as List).map((e) => e as String).toList()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ForgetAllResponseToJson(ForgetAllResponse instance) =>
    <String, dynamic>{
      'forget_all': instance.forgetAll,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
