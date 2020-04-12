// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_maltainvest_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountMaltainvestResponse _$NewAccountMaltainvestResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountMaltainvestResponse(
    newAccountMaltainvest:
        json['new_account_maltainvest'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$NewAccountMaltainvestResponseToJson(
        NewAccountMaltainvestResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'new_account_maltainvest': instance.newAccountMaltainvest,
    };
