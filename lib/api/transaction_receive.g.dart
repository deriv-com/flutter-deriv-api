// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    subscription: json['subscription'] as Map<String, dynamic>,
    transaction: json['transaction'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'subscription': instance.subscription,
      'transaction': instance.transaction,
    };
