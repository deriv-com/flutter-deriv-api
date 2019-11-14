// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return TransactionRequest()
    ..transaction = json['transaction'] as int
    ..subscribe = json['subscribe'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
      'subscribe': instance.subscribe,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
