// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse()
    ..transaction = json['transaction'] as Map<String, dynamic>
    ..subscription = json['subscription'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
      'subscription': instance.subscription,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
