// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_maltainvest_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountMaltainvestResponse _$NewAccountMaltainvestResponseFromJson(
    Map<String, dynamic> json) {
  return NewAccountMaltainvestResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..newAccountMaltainvest =
        json['new_account_maltainvest'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$NewAccountMaltainvestResponseToJson(
        NewAccountMaltainvestResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'new_account_maltainvest': instance.newAccountMaltainvest,
      'req_id': instance.reqId,
    };
