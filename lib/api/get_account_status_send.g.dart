// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_status_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountStatusRequest _$GetAccountStatusRequestFromJson(
    Map<String, dynamic> json) {
  return GetAccountStatusRequest(
    getAccountStatus: json['get_account_status'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$GetAccountStatusRequestToJson(
        GetAccountStatusRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'get_account_status': instance.getAccountStatus,
    };
