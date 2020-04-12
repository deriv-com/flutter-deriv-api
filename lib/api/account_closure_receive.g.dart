// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureResponse _$AccountClosureResponseFromJson(
    Map<String, dynamic> json) {
  return AccountClosureResponse(
    accountClosure: json['account_closure'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AccountClosureResponseToJson(
        AccountClosureResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'account_closure': instance.accountClosure,
    };
