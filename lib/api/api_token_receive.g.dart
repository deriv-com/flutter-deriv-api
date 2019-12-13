// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_token_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiTokenResponse _$ApiTokenResponseFromJson(Map<String, dynamic> json) {
  return ApiTokenResponse(
    apiToken: json['api_token'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ApiTokenResponseToJson(ApiTokenResponse instance) =>
    <String, dynamic>{
      'api_token': instance.apiToken,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
