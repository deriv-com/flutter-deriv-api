// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_real_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountRealResponse _$NewAccountRealResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountRealResponse(
    newAccountReal: json['new_account_real'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$NewAccountRealResponseToJson(
        NewAccountRealResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'new_account_real': instance.newAccountReal,
    };
