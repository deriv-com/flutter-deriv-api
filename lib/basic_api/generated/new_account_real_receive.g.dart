// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_real_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountRealResponse _$NewAccountRealResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountRealResponse(
    newAccountReal: json['new_account_real'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$NewAccountRealResponseToJson(
        NewAccountRealResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'new_account_real': instance.newAccountReal,
    };
