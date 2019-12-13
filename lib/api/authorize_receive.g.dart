// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeResponse _$AuthorizeResponseFromJson(Map<String, dynamic> json) {
  return AuthorizeResponse(
    authorize: json['authorize'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AuthorizeResponseToJson(AuthorizeResponse instance) =>
    <String, dynamic>{
      'authorize': instance.authorize,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
