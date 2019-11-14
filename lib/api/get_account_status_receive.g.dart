// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_status_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountStatusResponse _$GetAccountStatusResponseFromJson(
    Map<String, dynamic> json) {
  return GetAccountStatusResponse()
    ..getAccountStatus = json['get_account_status'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$GetAccountStatusResponseToJson(
        GetAccountStatusResponse instance) =>
    <String, dynamic>{
      'get_account_status': instance.getAccountStatus,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
