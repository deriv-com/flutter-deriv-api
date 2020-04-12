// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_status_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountStatusResponse _$GetAccountStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountStatusResponse(
    getAccountStatus: json['get_account_status'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetAccountStatusResponseToJson(
        GetAccountStatusResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'get_account_status': instance.getAccountStatus,
    };
