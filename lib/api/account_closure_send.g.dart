// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureRequest _$AccountClosureRequestFromJson(
    Map<String, dynamic> json) {
  return AccountClosureRequest(
    accountClosure: json['account_closure'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reason: json['reason'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AccountClosureRequestToJson(
        AccountClosureRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'account_closure': instance.accountClosure,
      'reason': instance.reason,
    };
