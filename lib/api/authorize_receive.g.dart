// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeResponse _$AuthorizeResponseFromJson(Map<String, dynamic> json) {
  return AuthorizeResponse(
    authorize: json['authorize'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AuthorizeResponseToJson(AuthorizeResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'authorize': instance.authorize,
    };
